local GameState = require("src.logic..GameState")
local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local View = require("src.graphics.View")
local Tilesheet = require("src.graphics.Tilesheet")
local Tilemap = require("src.logic.rooms.Tilemap")

local game
local tiles
local view
local tilemap

function love.load()
    math.randomseed(os.time())

    tiles = Tilesheet.create("assets/sprites/tiles/numbers.png", 8)

    local playerSprite = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)
    local player = Entity.create(playerSprite, 50, 50, 0, 5, KeyboardMovement)
    view = View.create(270, 180, 0, 0)
    game = GameState.create(player, view)
    tilemap = Tilemap.create()

end

function love.update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    game:update(dt)
end

function love.draw()
    game:draw()
    tilemap:draw(view, tiles)
end
