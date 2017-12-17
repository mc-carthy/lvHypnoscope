local GameState = require("src.logic..GameState")
local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local View = require("src.graphics.View")

local game
local view

function love.load()
    math.randomseed(os.time())


    local playerSprite = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)
    local player = Entity.create(playerSprite, 50, 50, 0, 5, KeyboardMovement)
    view = View.create(270, 180, 0, 0)
    game = GameState.create(player, view)

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
