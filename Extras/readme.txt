NOTE Complete these action Just Before you save and run your server - Last part of build Process.
#################################################################################################

1.  setup the config files for your resources, e.g es_extended, fivem-appearance, mono garage, esx_property, esx_hud, sna fuel etc.
2.  Config the ox.cfg file on the new server. Set target on/off, set stash size etc.
3.  Set your framework in the Renewed Banking config file. default is QB change to ESX.
4.  Add items from the ox-inventory file to ox-inventory/data/items file on the new server.

5.  Updating the Fuel System.
    #########################
  5a. Replace all occurences of "LegacyFuel" with "esx-sna-fuel" (or wathever your directory name is) in all your server resources exports.

  5b. Also Replace all occurences of "GetVehicleFuelLevel" and replace the statement by exports['sna-fuel']:GetFuel(vehicle) Exemple around line 740 of es_extended/client/functions 

    line:------------------------------------------------------------------------------------------------
    737-        bodyHealth = ESX.Math.Round(GetVehicleBodyHealth(vehicle), 1),
    738-        engineHealth = ESX.Math.Round(GetVehicleEngineHealth(vehicle), 1),
    739-        tankHealth = ESX.Math.Round(GetVehiclePetrolTankHealth(vehicle), 1),

    740-        fuelLevel = ESX.Math.Round(exports['esx-sna-fuel']:GetFuel(vehicle), 1),  <-- Change 
    741-        dirtLevel = ESX.Math.Round(GetVehicleDirtLevel(vehicle), 1),
    742-        color1 = colorPrimary,
    742-        color2 = colorSecondary,
    -------------------------------------------------------------------------------------------------

5.  Updating esx_Property Wardrobe System.
    ######################################
    5a. Comment out --[[ ]]-- all the code below the header labeled `---Interacting With Wardrobe Markers ---` in the esx_property config.lua script file.
    5b. copy the below snippet and place it between the header mentioned above and the commented out scipt from the actions above, so it looks like bellow.

------------------Interacting With Wardrobe Markers -------------------------------------------

Config.WardrobeInteraction = function(PropertyId, Interaction)        <--COPY
    exports['fivem-appearance']:openWardrobe()                        <--COPY
end                                                                   <--COPY

--[[Config.WardrobeInteraction = function(PropertyId, Interaction)
  ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
    local elements = {{unselectable = true, icon = "fas fa-tshirt", title = "Wardrobe"}}

------------------------------------------------------------------------------------------------


6. Amending you SQL Server Database.
   #################################
  6a. Delete the following data from the `datastore' table in your database,
    `user_ears`
    `user_glasses`
    `user_helmet`
    `user_mask`

  6b. Drop your 'vehicles' table from your servers sql database.
  6c. Run the 'vehicles-456-total.sql file into you datebase.











Last Step.  After you have completly started the server first time. Select restart server on the txadmin console. it should now start with not errors.  

Current known server start errors:
* esx_vehicleshop


