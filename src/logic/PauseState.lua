local GameController = require("src.logic.GameController")

local pause = {}

local update = function(self, dt)

end

local draw = function(self)
    self.view:inDisplayContext(function()
        love.graphics.print("Game Paused", 100, 10)
    end)
end

local keyPressed = function(self, key)
    if key == "q" then
        GameController.get():popState()
    end
end

pause.create = function(view)
    local inst = {}

    inst.view = view

    inst.update = update
    inst.draw = draw
    inst.keyPressed = keyPressed

    return inst
end

return pause
