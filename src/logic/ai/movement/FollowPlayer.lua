local V = require("src.math.Vector2")

local followPlayer = {}

followPlayer.update = function(entity, dt, game)
    local playerPos = game.player:toPosition()
    local entityPos = entity:toPosition()

    local unitV = V.normalise(entityPos, playerPos)

    entity.x = entity.x + unitV.x * entity.speed * dt
    entity.y = entity.y + unitV.y * entity.speed * dt
end

return followPlayer