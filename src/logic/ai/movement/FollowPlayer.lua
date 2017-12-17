local V = require("src.math.Vector2")

local followPlayer = {}

followPlayer.update = function(entity, game)
    local playerPos = game.player:toPosition()
    local entityPos = entity:toPosition()
    local dx = 0
    local dz = 0
    local room = game.map:currentRoom()

    local dst = V.distance(entityPos, playerPos)
    -- TODO remove the hard-coded threshold below
    if dst > 1 then
        local unitV = V.normalise(entityPos, playerPos)

        dx = unitV.x * entity.speed * game.dt
        dz = unitV.z * entity.speed * game.dt

        local newX = entity.x + dx
        local newZ = entity.z + dz

        if room:walkable(newX, newZ) then
            entity.x = newX
            entity.z = newZ
        end
    end
end

return followPlayer
