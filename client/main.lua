Citizen.CreateThread(function()
    -- Disable EMS vehicle spawn points
    SetVehicleModelIsSuppressed(GetHashKey("ambulance"), true)
    SetVehicleModelIsSuppressed(GetHashKey("firetruk"), true)
    SetVehicleModelIsSuppressed(GetHashKey("polmav"), true)

    -- Disable EMS personnel spawn points
    SetPedModelIsSuppressed(GetHashKey("s_m_m_paramedic_01"), true)
    SetPedModelIsSuppressed(GetHashKey("s_m_m_paramedic_02"), true)
    SetPedModelIsSuppressed(GetHashKey("s_m_y_fireman_01"), true)
    SetPedModelIsSuppressed(GetHashKey("s_m_y_pilot_01"), true)

    -- Disable police vehicle spawn points
    SetVehicleModelIsSuppressed(GetHashKey("police"), true)
    SetVehicleModelIsSuppressed(GetHashKey("police2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("police3"), true)
    SetVehicleModelIsSuppressed(GetHashKey("police4"), true)
    SetVehicleModelIsSuppressed(GetHashKey("fbi"), true)
    SetVehicleModelIsSuppressed(GetHashKey("fbi2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("policet"), true)
    SetVehicleModelIsSuppressed(GetHashKey("policeb"), true)
    SetVehicleModelIsSuppressed(GetHashKey("riot"), true)

    -- Disable police personnel spawn points
    SetPedModelIsSuppressed(GetHashKey("s_m_y_cop_01"), true)
    SetPedModelIsSuppressed(GetHashKey("s_m_y_cop_02"), true)
    SetPedModelIsSuppressed(GetHashKey("s_m_y_swat_01"), true)
    SetPedModelIsSuppressed(GetHashKey("s_m_y_hwaycop_01"), true)

    -- Disable military vehicle spawn points
    SetVehicleModelIsSuppressed(GetHashKey("apc"), true)
    SetVehicleModelIsSuppressed(GetHashKey("barracks"), true)
    SetVehicleModelIsSuppressed(GetHashKey("barracks2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("barracks3"), true)
    SetVehicleModelIsSuppressed(GetHashKey("rhino"), true)
    SetVehicleModelIsSuppressed(GetHashKey("hydra"), true)
    SetVehicleModelIsSuppressed(GetHashKey("lazer"), true)
    SetVehicleModelIsSuppressed(GetHashKey("valkyrie"), true)
    SetVehicleModelIsSuppressed(GetHashKey("valkyrie2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("savage"), true)
    SetVehicleModelIsSuppressed(GetHashKey("trailersmall2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("barrage"), true)
    SetVehicleModelIsSuppressed(GetHashKey("chernobog"), true)
    SetVehicleModelIsSuppressed(GetHashKey("khanjali"), true)
    SetVehicleModelIsSuppressed(GetHashKey("menacer"), true)
    SetVehicleModelIsSuppressed(GetHashKey("scarab"), true)
    SetVehicleModelIsSuppressed(GetHashKey("scarab2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("scarab3"), true)
    SetVehicleModelIsSuppressed(GetHashKey("armytanker"), true)--
    SetVehicleModelIsSuppressed(GetHashKey("avenger"), true)
    SetVehicleModelIsSuppressed(GetHashKey("avenger2"), true)
    SetVehicleModelIsSuppressed(GetHashKey("tula"), true)
    SetVehicleModelIsSuppressed(GetHashKey("bombushka"), true)
    SetVehicleModelIsSuppressed(GetHashKey("molotok"), true)
    SetVehicleModelIsSuppressed(GetHashKey("volatol"), true)
    SetVehicleModelIsSuppressed(GetHashKey("starling"), true)
    SetVehicleModelIsSuppressed(GetHashKey("mogul"), true)
    SetVehicleModelIsSuppressed(GetHashKey("nokota"), true)
    SetVehicleModelIsSuppressed(GetHashKey("strikeforce"), true)
    SetVehicleModelIsSuppressed(GetHashKey("rogue"), true)

-- Disable military personnel spawn points
SetPedModelIsSuppressed(GetHashKey("s_m_y_marine_01"), true)
SetPedModelIsSuppressed(GetHashKey("s_m_y_marine_02"), true)
SetPedModelIsSuppressed(GetHashKey("s_m_y_marine_03"), true)
SetPedModelIsSuppressed(GetHashKey("s_m_m_marine_01"), true)
SetPedModelIsSuppressed(GetHashKey("s_m_m_marine_02"), true)

-- Disable military helicopter and plane spawn points
SetVehicleModelIsSuppressed(GetHashKey("cargoplane"), true)
SetVehicleModelIsSuppressed(GetHashKey("jet"), true)
SetVehicleModelIsSuppressed(GetHashKey("lazer"), true)
SetVehicleModelIsSuppressed(GetHashKey("buzzard"), true)
SetVehicleModelIsSuppressed(GetHashKey("savage"), true)
SetVehicleModelIsSuppressed(GetHashKey("valkyrie"), true)
SetVehicleModelIsSuppressed(GetHashKey("valkyrie2"), true)
SetVehicleModelIsSuppressed(GetHashKey("besra"), true)
SetVehicleModelIsSuppressed(GetHashKey("titan"), true)
SetVehicleModelIsSuppressed(GetHashKey("hydra"), true)
SetVehicleModelIsSuppressed(GetHashKey("cargobob"), true)
SetVehicleModelIsSuppressed(GetHashKey("cargobob2"), true)
SetVehicleModelIsSuppressed(GetHashKey("cargobob3"), true)
SetVehicleModelIsSuppressed(GetHashKey("cargobob4"), true)
SetVehicleModelIsSuppressed(GetHashKey("akula"), true)
SetVehicleModelIsSuppressed(GetHashKey("hunt"), true)

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
        if model == GetHashKey("ambulance") or model == GetHashKey("firetruk") or model == GetHashKey("polmav") or model == GetHashKey("riot") or model == GetHashKey("apc") or model == GetHashKey("barracks") or model == GetHashKey("barracks2") or model == GetHashKey("barracks3") or model == GetHashKey("rhino") or model == GetHashKey("hydra") or model == GetHashKey("lazer") or model == GetHashKey("cargoplane") or model == GetHashKey("jet") or model == GetHashKey("buzzard") or model == GetHashKey("savage") or model == GetHashKey("valkyrie") or model == GetHashKey("valkyrie2") or model == GetHashKey("besra") or model == GetHashKey("titan") then
            SetEntityAsMissionEntity(vehicle, true, true)
            DeleteVehicle(vehicle)
        end
    end

-- Remove EMS personnel and military personnel
local peds = GetGamePool("CPed")
for i=1,#peds do
    local ped = peds[i]
    local model = GetEntityModel(ped)
    if model == GetHashKey("s_m_m_paramedic_01") or model == GetHashKey("s_m_m_paramedic_02") or model == GetHashKey("s_m_y_fireman_01") or model == GetHashKey("s_m_y_pilot_01") or model == GetHashKey("s_m_y_marine_01") or model == GetHashKey("s_m_y_marine_02") or model == GetHashKey("s_m_y_marine_03") or model == GetHashKey("s_m_m_marine_01") or model == GetHashKey("s_m_m_marine_02") or model == GetHashKey("s_m_y_blackops_01") or model == GetHashKey("s_m_y_blackops_02") or model == GetHashKey("s_m_y_blackops_03") then
        SetEntityAsMissionEntity(ped, true, true)
        DeletePed(ped)
    end
end

-- Remove military vehicles
local vehicles = GetGamePool("CVehicle")
for i=1,#vehicles do
    local vehicle = vehicles[i]
    local model = GetEntityModel(vehicle)
    if model == GetHashKey("apc") or model == GetHashKey("barracks") or model == GetHashKey("barracks2") or model == GetHashKey("barracks3") or model == GetHashKey("rhino") or model == GetHashKey("hydra") or model == GetHashKey("lazer") or model == GetHashKey("valkyrie") or model == GetHashKey("savage") or model == GetHashKey("buzzard") or model == GetHashKey("cargoplane") or model == GetHashKey("jet") or model == GetHashKey("cargobob") or model == GetHashKey("cargobob2") or model == GetHashKey("cargobob3") or model == GetHashKey("cargobob4") or model == GetHashKey("armytanker") or model == GetHashKey("akula") or model == GetHashKey("hunt") or model == GetHashKey("avenger") or model == GetHashKey("avenger2") or model == GetHashKey("tula") or model == GetHashKey("bombushka") or model == GetHashKey("molotok") or model == GetHashKey("volatol") or model == GetHashKey("starling") or model == GetHashKey("mogul") or model == GetHashKey("nokota") or model == GetHashKey("strikeforce") or model == GetHashKey("rogue") then
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
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