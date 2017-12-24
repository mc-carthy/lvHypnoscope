local GameController = require("src.logic.GameController")
local Menu = require("src.logic.Menu")

local pause = {}

local update = function(self, dt)

end

local draw = function(self)
    self.menu:draw(self.view)
    self.view:inDisplayContext(function()
        love.graphics.print("Game Paused", 100, 10)
    end)
end

local keyPressed = function(self, key)
    if key == "escape" then
        GameController.get():popState()
    end

    if key == "return" then
        self.menu:confirm()
    end

    if key == "down" then
        self.menu:next()
    end

    if key == "up" then
        self.menu:previous()
    end
end

pause.create = function(view)
    local inst = {}

    inst.view = view
    inst.menu = Menu.create({
        Menu.createOption("Continue", function()
            GameController.get():popState()
        end),
        Menu.createOption("Exit Game", function()
            love.event.quit()
        end)
    })

    inst.update = update
    inst.draw = draw
    inst.keyPressed = keyPressed

    return inst
end

return pause
