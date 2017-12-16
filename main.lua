local GameState = require("src.logic..GameState")
local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local Bounce = require("src.logic.ai.movement.Bounce")
local FollowPlayer = require("src.logic.ai.movement.FollowPlayer")

local game

function love.load()
    local playerSprite = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)
    local player = Entity.create(playerSprite, 50, 50, 0, 100, KeyboardMovement)
    game = GameState.create(player)

    local slimeSprite = Sprite.create("assets/sprites/slime.png", 0, 0, 4, 4)

    for i = 1, 2 do
        local randomX = math.random(love.graphics.getWidth())
        local randomY = math.random(love.graphics.getHeight())
        local slime = Entity.create(slimeSprite, randomX, randomY, 0, 20, FollowPlayer)
        game:addEntity(slime)
    end

end

function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    game:update(dt)
end

function love.draw()
    game:draw()
end