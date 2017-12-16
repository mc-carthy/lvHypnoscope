local GameState = require("src.logic..GameState")
local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local Bounce = require("src.logic.ai.movement.Bounce")

local player
local playerSprite
local slime
local slimeSprite

function love.load()
    game = GameState.create()

    playerSprite = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)
    player = Entity.create(playerSprite, 50, 50, 0, 100, KeyboardMovement)
    slimeSprite = Sprite.create("assets/sprites/slime.png", 0, 0, 4, 4)
    slime = Entity.create(slimeSprite, 250, 100, 0, 300, Bounce)
    slime2 = Entity.create(slimeSprite, 150, 300, 0, 100, Bounce)

    game:addEntity(player)
    game:addEntity(slime)
    game:addEntity(slime2)
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