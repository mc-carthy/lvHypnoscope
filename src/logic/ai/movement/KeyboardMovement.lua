local Vector2 = require("src.math.Vector2")

local keyboardMovement = {}

function keyboardMovement.update(entity, game)
    local dx = 0
    local dz = 0
    local currentRoom = game.map:currentRoom()

    if love.keyboard.isDown("right") then dx = entity.speed end
    if love.keyboard.isDown("left") then dx = -entity.speed end
    if love.keyboard.isDown("down") then dz = entity.speed end
    if love.keyboard.isDown("up") then dz = -entity.speed end

    newX = entity.x + dx
    newZ = entity.z + dz

    local screenPos = Vector2.worldToScreen({ x = newX, y = entity.y, z = newZ })

    if currentRoom:walkable(screenPos.x, screenPos.y) then
        entity.x = newX
        entity.z = newZ
    end
end

return keyboardMovement
