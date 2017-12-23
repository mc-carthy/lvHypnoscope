local V = require("src.math.Vector2")

local bounce = {}

local bounceHeight = function(entity, game)
    local player = game.player

    local entityPosition = entity.position
    local playerPosition = game.player.position
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

    local pos = entity.position

    if pos.y < -bounceHeight(entity, game) then
        -- entity.y = bounceHeight(entity, game)
        entity.dir = -1
    elseif pos.y > 0 then
        -- entity.y = 0
        entity.dir = 1
    end

    local newY = pos.y - (entity.speed * 2 * entity.dir * game.dt)

    entity.position:update(pos.x, newY, pos.z)
end

return bounce
