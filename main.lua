local GameState = require("src.logic..GameState")
local View = require("src.graphics.View")
local Player = require("src.mobs.Player")

DEBUG = true
local game
local view

function love.load()
    math.randomseed(os.time())

    view = View.create(270, 180, 0, 0)
    game = GameState.create(Player.create(), view)

end

function love.keypressed(key)
    game:keyPressed(key)
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
