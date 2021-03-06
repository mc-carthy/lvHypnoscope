local GameController = require("src.logic.GameController")
local Menu = require("src.logic.menus.Menu")
local MenuStack = require("src.logic.menus.MenuStack")

local pause = {}

local update = function(self, dt)

end

local draw = function(self)
    self.menuStack:draw(self.view)
    self.view:inDisplayContext(function()
        love.graphics.print("Game Paused", 100, 10)
    end)
end

local keyPressed = function(self, key)
    if key == "escape" then
        GameController.get():popState()
    end

    self.menuStack:keyPressed(key)
end

pause.create = function(view)
    local inst = {}

    local confirmExitMenu = Menu.create(50, 50, {
        Menu.createOption("No", function()
            inst.menuStack:popMenu()
        end),
        Menu.createOption("Yes", function()
            GameController.get():exit()
        end)
    })

    inst.view = view
    inst.menuStack = MenuStack.create()
    inst.menuStack:pushMenu(
        Menu.create(10, 10, {
            Menu.createOption("Continue", function()
                GameController.get():popState()
            end),
            Menu.createOption("Exit Game", function()
                inst.menuStack:pushMenu(confirmExitMenu)
            end)
        })
    )

    inst.update = update
    inst.draw = draw
    inst.keyPressed = keyPressed

    return inst
end

return pause
