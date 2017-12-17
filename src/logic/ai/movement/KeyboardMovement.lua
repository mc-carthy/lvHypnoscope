local Vector2 = require("src.math.Vector2")

local keyboardMovement = {}

function keyboardMovement.update(entity, game)
    local dx = 0
    local dz = 0
    local currentRoom = game.map:currentRoom()
    local isMoving = false

    if love.keyboard.isDown("right") and not isMoving then dx = entity.speed isMoving = true end
    if love.keyboard.isDown("left") and not isMoving then dx = -entity.speed isMoving = true end
    if love.keyboard.isDown("down") and not isMoving then dz = entity.speed isMoving = true end
    if love.keyboard.isDown("up") and not isMoving then dz = -entity.speed isMoving = true end

    newX = entity.x + dx * game.dt
    newZ = entity.z + dz * game.dt

    if currentRoom:walkable(newX, newZ) then
        entity.x = newX
        entity.z = newZ
    end

    game.debugString = math.floor(entity.x) .. ", " .. math.floor(entity.y) .. ", " .. math.floor(entity.z)
end

return keyboardMovement
