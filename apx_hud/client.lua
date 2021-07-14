s = 500

CreateThread(function()
    while true do
        Wait(s)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            thirst = status.getPercent()
        end)
        Wait(s)
        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            hunger = status.getPercent()
        end)
        Wait(s)
    end
    Wait(s)
end)

CreateThread(function()
    while true do
        Wait(s)
        local _ped = PlayerPedId()
        local o2
        local swim = IsPedSwimmingUnderWater(ped)
        o2 = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10

        -- MiniMapa

        if not IsPedInAnyVehicle(PlayerPedId()) then
            DisplayRadar(false)
            SendNUIMessage({showhud = false})
        elseif IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({showhud = true})
            DisplayRadar(true)
        end  

        SendNUIMessage({
            action = 'tick',
            health = (GetEntityHealth(_ped)-100),
            armour = GetPedArmour(_ped),
            stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
            o2 = o2,
            swim = swim,
            hunger = hunger,
            thirst = thirst

        })
    end
end)