local GameState = require("src.logic.GameState")
local View = require("src.graphics.View")
local Player = require("src.mobs.Player")
local GameController = require("src.logic.GameController")

-- DEBUG = true
local game
local view
local controller

function love.load()
    math.randomseed(os.time())

    local view = View.create(270, 180, 0, 0)
    local game = GameState.create(Player.create(), view)
    controller = GameController.get()
    controller:pushState(game)
end

function love.keypressed(key)
    controller:keyPressed(key)
end

function love.update(dt)
    controller:update(dt)
end

function love.draw()
    controller:draw()
end
