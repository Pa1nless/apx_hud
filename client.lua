local CreateThread = CreateThread
local Wait = Wait
local PlayerPedId = PlayerPedId
local Wait = Wait
local PlayerId = PlayerId

-- Update Time
local sTime <const> = 500
local hunger, thirst = 100, 100

AddEventHandler("esx_status:onTick", function(status)
    for k, v in pairs(status) do
        if v.name == 'hunger' then hunger = v.percent
        elseif v.name == 'thirst' then thirst = v.percent
        end
    end
end)

CreateThread(function()
    local _ped = PlayerPedId()
    local _id = PlayerId()
    while true do
        local o2 = GetPlayerUnderwaterTimeRemaining(_id) * 10
        local swim = IsPedSwimmingUnderWater(ped)
        local stamina = 100 - GetPlayerSprintStaminaRemaining(_id)
        local armour = GetPedArmour(_ped)
        local health = (GetEntityHealth(_ped) - 100)

        -- Minimap
        if not IsPedInAnyVehicle(_ped) then
            DisplayRadar(false)
            SendNUIMessage({showhud = false})
        else
            DisplayRadar(true)
            SendNUIMessage({showhud = true})
        end  

        SendNUIMessage({
            action = 'tick',
            health = health,
            armour = armour,
            stamina = stamina,
            o2 = o2,
            swim = swim,
            hunger = hunger,
            thirst = thirst
        })
        Wait(s)
    end
end)
