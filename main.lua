local Sprite = require("src.graphics.sprite")

local player

function love.load()
    player = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)
end

function love.update()
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end

    player.x = player.x + 5
    if player.x > love.graphics.getWidth() then
        player.x = 0
    end
end

function love.draw()
    player:draw()
end