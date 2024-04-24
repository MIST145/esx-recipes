NOTE Complete these action before starting your server that is part of the server build process.

1.  

2.  Add items from the ox-inventory file to ox-inventory/data/items file on the new server.

3.  Add & Update fuel system, See below

  3a. Replace all occurences of "LegacyFuel" by "esx-sna-fuel" (or wathever your directory name is) in all your server resources exports.

  3b. Replace also all occurences of "GetVehicleFuelLevel" and replace the statement by exports['sna-fuel']:GetFuel(vehicle) Exemple around line 740 of es_extended/client/functions -
------------------------------------------------------------------------------------------------
737-        bodyHealth = ESX.Math.Round(GetVehicleBodyHealth(vehicle), 1),
738-        engineHealth = ESX.Math.Round(GetVehicleEngineHealth(vehicle), 1),
739-        tankHealth = ESX.Math.Round(GetVehiclePetrolTankHealth(vehicle), 1),

740-        fuelLevel = ESX.Math.Round(exports['esx-sna-fuel']:GetFuel(vehicle), 1),  <-- Change
741-        dirtLevel = ESX.Math.Round(GetVehicleDirtLevel(vehicle), 1),
742-        color1 = colorPrimary,
742-        color2 = colorSecondary,
-------------------------------------------------------------------------------------------------

4. Config the ox.cfg file on the new server. Set target on/off, set stash size etc.
5. Set your framework in the Renewed Banking config file.
4. setup the config files for your resources, e.g sna fuel, mono garage etc.

