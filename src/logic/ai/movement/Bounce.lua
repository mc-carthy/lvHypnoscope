local V = require("src.math.Vector2")

local bounce = {}

local bounceHeight = function(entity, game)
    local player = game.player

    local entityPosition = entity:toPosition()
    local playerPosition = game.player:toPosition()
    local dst = V.distance(entityPosition, playerPosition)

    if dst < 100 then
        return 400
    else
        return 200
    end
end

function bounce.update(entity, game)
    if not entity.dir then
        entity.dir = 1
    end

    if entity.z > bounceHeight(entity, game) then
        entity.z = bounceHeight(entity, game)
        entity.dir = -1
    elseif entity.z < 0 then
        entity.z = 0
        entity.dir = 1
    end

    entity.z = entity.z + entity.speed * entity.dir
end

return bounce
