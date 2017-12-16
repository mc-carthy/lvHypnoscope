local keyboardMovement = {}

function keyboardMovement.update(entity)
    if love.keyboard.isDown("right") then entity.x = entity.x + entity.speed end
    if love.keyboard.isDown("left") then entity.x = entity.x - entity.speed end
    if love.keyboard.isDown("down") then entity.y = entity.y + entity.speed end
    if love.keyboard.isDown("up") then entity.y = entity.y - entity.speed end
end

return keyboardMovement
