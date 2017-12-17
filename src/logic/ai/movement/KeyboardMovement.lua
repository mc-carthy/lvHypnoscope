local keyboardMovement = {}

function keyboardMovement.update(entity, game)
    local dx = 0
    local dy = 0
    local currentRoom = game.map:currentRoom()

    if love.keyboard.isDown("right") then dx = entity.speed end
    if love.keyboard.isDown("left") then dx = -entity.speed end
    if love.keyboard.isDown("down") then dy = entity.speed end
    if love.keyboard.isDown("up") then dy = -entity.speed end

    newX = entity.x + dx
    newY = entity.y + dy

    if currentRoom:walkable(newX, newY) then
        entity.x = newX
        entity.y = newY
    end
end

return keyboardMovement
