local bounce = {}

local bounceHeight = function(entity, game)
    local player = game.player

    local playerX = player.x
    local playerY = player.y
    local dx = playerX - entity.x
    local dy = playerY - entity.y
    local dst = math.sqrt(math.pow(dx, 2) + math.pow(dy, 2))

    if dst < 100 then 
        return 400 
    else 
        return 200 
    end
end

function bounce.update(entity, dt, game)
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

    entity.z = entity.z + entity.speed * dt * entity.dir
end

return bounce