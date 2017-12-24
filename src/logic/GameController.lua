local gameController = {}

local pushState = function(self, state)
    table.insert(self.states, state)
end

local popState = function(self)
    table.remove(self.states, #self.states)
end

local _getActiveState = function(self)
    return self.states[#self.states]
end

local update = function(self, dt)
    _getActiveState(self):update(dt)
end

local draw = function(self)
    _getActiveState(self):draw()
end

local keyPressed = function(self, key)
    _getActiveState(self):keyPressed(key)
end

local create = function()
    local inst = {}

    inst.states = {}

    inst.update = update
    inst.draw = draw
    inst.keyPressed = keyPressed
    inst.pushState = pushState
    inst.popState = popState

    return inst
end

local controller = nil

gameController.get = function()
    if controller == nil then
        controller = create()
    end

    return controller
end

return gameController
