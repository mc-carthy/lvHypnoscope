local Vector2 = require("src.math.Vector2")
local Animation = require("src.graphics.Animation")

local keyboardMovement = {}

function keyboardMovement.update(entity, game)
    local dx = 0
    local dz = 0
    local currentRoom = game.map:currentRoom()
    local isMoving = false

    if love.keyboard.isDown("right") and not isMoving then
        dx = entity.speed
        isMoving = true
        entity.position:faceRight()
    end
    if love.keyboard.isDown("left") and not isMoving then
        dx = -entity.speed
        isMoving = true
        entity.position:faceLeft()
    end
    if love.keyboard.isDown("down") and not isMoving then dz = entity.speed isMoving = true end
    if love.keyboard.isDown("up") and not isMoving then dz = -entity.speed isMoving = true end

    if isMoving then
        entity.sprite:setAnimation(Animation.WALK)
    else
        entity.sprite:setAnimation(Animation.STAND)
    end

    newX = entity.position.x + dx * game.dt
    newZ = entity.position.z + dz * game.dt

    if currentRoom:walkable(newX, newZ) then
        entity.position:setPosition(newX, entity.position.y, newZ)
    end

    game.debugString = math.floor(entity.position.x) .. ", " .. math.floor(entity.position.y) .. ", " .. math.floor(entity.position.z)
end

return keyboardMovement
