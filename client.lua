local SPOTS = {
    {
        ['name'] = 'guns',
        ['coords'] = vector3(1375.9591, -586.0296, 75.1772),
        ['label'] = 'ZBRANE DO ZACIATKU',
    },
    {
        ['name'] = 'event',
        ['coords'] = vector3(1373.6096, -588.7269, 75.1772),
        ['label'] = 'EVENT SHOP',
    },
    {
        ['name'] = 'clothing',
        ['coords'] = vector3(1383.6841, -591.5334, 75.1772),
        ['label'] = 'OBLECENIE',
    },
}

local DRAW_DISTANCE = 30.0

CreateThread(function ()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        local labelsToShow = {}

        for _, spotData in pairs(SPOTS) do
            local spotCoords = spotData.coords
            local labelText = spotData.label

            local distance = #(spotCoords - playerCoords)

            if distance <= DRAW_DISTANCE then
                local success, screenX, screenY = GetScreenCoordFromWorldCoord(spotCoords.x, spotCoords.y, spotCoords.z)

                if success then
                    table.insert(labelsToShow, {
                        label = labelText,
                        x = screenX,
                        y = screenY
                    })
                end
            end
        end

        SendNUIMessage({
            type = 'updateLabels',
            labels = labelsToShow
        })

        SetNuiFocus(false, false)

        Wait(1)
    end
end)
