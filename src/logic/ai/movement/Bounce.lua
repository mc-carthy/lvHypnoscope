local V = require("src.math.Vector2")

local bounce = {}

local bounceHeight = function(entity, game)
    local player = game.player

    local entityPosition = entity:toPosition()
    local playerPosition = game.player:toPosition()
    local dst = V.distance(entityPosition, playerPosition)

    if dst < 50 then
        return 40
    else
        return 20
    end
end

function bounce.update(entity, game)
    if not entity.dir then
        entity.dir = 1
    end

    if entity.y < -bounceHeight(entity, game) then
        -- entity.y = bounceHeight(entity, game)
        entity.dir = -1
    elseif entity.y > 0 then
        -- entity.y = 0
        entity.dir = 1
    end

    entity.y = entity.y - (entity.speed * 2 * entity.dir * game.dt)
end

return bounce
