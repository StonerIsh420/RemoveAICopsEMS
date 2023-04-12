Citizen.CreateThread(function()
    while true do
        Citizen.Wait(525) -- wait 0.525 seconds before running the loop again

        local playerPed = GetPlayerPed(-1)
        local playerLocalisation = GetEntityCoords(playerPed)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)

        -- Remove EMS vehicles
        local vehicles = GetGamePool("CVehicle")
        for i=1,#vehicles do
            local vehicle = vehicles[i]
            local model = GetEntityModel(vehicle)
            if model == GetHashKey("ambulance") or model == GetHashKey("firetruk") or model == GetHashKey("polmav") or model == GetHashKey("riot") then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end
        end

        -- Remove EMS personnel
        local peds = GetGamePool("CPed")
        for i=1,#peds do
            local ped = peds[i]
            local model = GetEntityModel(ped)
            if model == GetHashKey("s_m_m_paramedic_01") or model == GetHashKey("s_m_m_paramedic_02") or model == GetHashKey("s_m_y_fireman_01") or model == GetHashKey("s_m_y_pilot_01") then
                SetEntityAsMissionEntity(ped, true, true)
                DeletePed(ped)
            end
        end

        -- Reset NPC behavior
        SetPedDensityMultiplierThisFrame(1.0)
        SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
        SetVehicleDensityMultiplierThisFrame(1.0)
        SetRandomVehicleDensityMultiplierThisFrame(1.0)
        SetParkedVehicleDensityMultiplierThisFrame(1.0)
        SetScenarioTypeEnabled("DRIVE", true)
        SetScenarioTypeEnabled("WALK", true)
    end
end)
