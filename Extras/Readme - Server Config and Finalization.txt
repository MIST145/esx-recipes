NOTE Complete these action Just Before you save and run your server - Setup will be displaying the server config file as its the last part of build Process.
#################################################################################################

1.  setup the config files for your resources, e.g es_extended, fivem-appearance, mono garage, dsPaycheckSystem, esx_property, esx_hud, sna fuel, cityhall etc.
2.  Config the ox.cfg file on the new server. Set target on/off, set stash size etc.
3.  Set your framework in the Renewed Banking config file. default is QB change to ESX.
4.  Add items from the ox-inventory file to ox-inventory/data/items file on the new server.

5.  Intergrtating the Fuel System.
    ##############################
  5a.  Replace all occurences of "LegacyFuel" with "esx-sna-fuel" (or wathever your directory name is) in all your server resources exports.

  5b.  Also Replace all occurences of "GetVehicleFuelLevel" and replace the statement by exports['esx-sna-fuel']:GetFuel(vehicle) Exemple around line 740 of es_extended/client/functions 

    line:------------------------------------------------------------------------------------------------
    737-        bodyHealth = ESX.Math.Round(GetVehicleBodyHealth(vehicle), 1),
    738-        engineHealth = ESX.Math.Round(GetVehicleEngineHealth(vehicle), 1),
    739-        tankHealth = ESX.Math.Round(GetVehiclePetrolTankHealth(vehicle), 1),

    740-        fuelLevel = ESX.Math.Round(exports['esx-sna-fuel']:GetFuel(vehicle), 1),  <-- Change 
    741-        dirtLevel = ESX.Math.Round(GetVehicleDirtLevel(vehicle), 1),
    742-        color1 = colorPrimary,
    742-        color2 = colorSecondary,
    -------------------------------------------------------------------------------------------------

6.  Intergrating fivem-appreance Wardrobe System into esx_Property.
    ###############################################################
    6a.  Comment out --[[ ]]-- all the code below the header labeled `---Interacting With Wardrobe Markers ---` in the esx_property config.lua script file.
    6b.  Copy the below snippet and place it between the header mentioned above and the commented out scipt from the actions above, so it looks like bellow.
    ------------------Interacting With Wardrobe Markers -------------------------------------------

    Config.WardrobeInteraction = function(PropertyId, Interaction)        <--COPY
        exports['fivem-appearance']:openWardrobe()                        <--COPY
    end                                                                   <--COPY

    --[[Config.WardrobeInteraction = function(PropertyId, Interaction)
      ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
        local elements = {{unselectable = true, icon = "fas fa-tshirt", title = "Wardrobe"}}

------------------------------------------------------------------------------------------------

7. Set Spawn Locations for New Character Registrations.
   ####################################################
    7a.  Replace the `Config.DefaultSpawns =` from resource  ` ./[core]/es_extended/config.lua ` with  ` { x = -1107.4496, y = -2845.4797, z = 14.8864, heading = 243.7610 } `.
    7b.  Replace the `Config.Spawn =` from resource  ` ./[core]/esx_multicharacter/config.lua ` with  ` { x = -1107.3363, y = -2844.8254, z = 14.8864, heading = 225.5861 } `.


8. Change SQL Query to allow 60 char Identifier
   ############################################
    8a. Find ` local length = 42 + #PREFIX ` from resource  ` ./[core]/esx_multicharacter/server/main.lua & replace the 42 value with ` 56 `   APPROX LINE `160`


9. Intergrating Player PayCheck System into es_extended
   ############################################
Go to es_extended/server/paycheck.lua and replace the StartPayCheck() function with mine below.

function StartPayCheck()
  CreateThread(function()
    while true do
      Wait(Config.PaycheckInterval)

      for player, xPlayer in pairs(ESX.Players) do
        local job = xPlayer.job.grade_name
        local salary = xPlayer.job.grade_salary
        
        if salary > 0 then
          if job == 'unemployed' then -- unemployed
            exports['randol_paycheck']:AddToPaycheck(xPlayer.identifier, salary)
            TriggerClientEvent('esx:showAdvancedNotification', player, TranslateCap('bank'), TranslateCap('received_paycheck'), TranslateCap('received_help', salary),
              'CHAR_BANK_MAZE', 9)
          elseif Config.EnableSocietyPayouts then -- possibly a society
            TriggerEvent('esx_society:getSociety', xPlayer.job.name, function(society)
              if society ~= nil then -- verified society
                TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
                  if account.money >= salary then -- does the society money to pay its employees?
                    exports['randol_paycheck']:AddToPaycheck(xPlayer.identifier, salary)
                    account.removeMoney(salary)

                    TriggerClientEvent('esx:showAdvancedNotification', player, TranslateCap('bank'), TranslateCap('received_paycheck'),
                      TranslateCap('received_salary', salary), 'CHAR_BANK_MAZE', 9)
                  else
                    TriggerClientEvent('esx:showAdvancedNotification', player, TranslateCap('bank'), '', TranslateCap('company_nomoney'), 'CHAR_BANK_MAZE', 1)
                  end
                end)
              else -- not a society
                exports['randol_paycheck']:AddToPaycheck(xPlayer.identifier, salary)
                TriggerClientEvent('esx:showAdvancedNotification', player, TranslateCap('bank'), TranslateCap('received_paycheck'), TranslateCap('received_salary', salary),
                  'CHAR_BANK_MAZE', 9)
              end
            end)
          else -- generic job
            exports['randol_paycheck']:AddToPaycheck(xPlayer.identifier, salary)
            TriggerClientEvent('esx:showAdvancedNotification', player, TranslateCap('bank'), TranslateCap('received_paycheck'), TranslateCap('received_salary', salary),
              'CHAR_BANK_MAZE', 9)
          end
        end
      end
    end
  end)
end


END. no more actions to complete
   #################################



FINAL Step.  After you have completly started the server first time. Select restart server on the txadmin console. it should now start with not errors.  
###########

Current known server start errors:
* esx_vehicleshop


