local Map = require("src.logic.rooms.Map")

local gameState = {}

local modulate = function(self)
    return self.updates % 2 == 0
end

local addEntity = function(self, entity)
    table.insert(self.entities, entity)
end

local keyPressed = function(self, key)
    if key == "z" then
        self.player:action1(self)
    end
end

local update = function(self, dt)
    self.updates = self.updates + 1
    self.dt = dt
    self.map:update(self)
    for _, entity in ipairs(self.entities) do
        entity:update(self)
    end
    self.player:update(self)
    self.view:update(self)
end

local draw = function(self)
    self.map:draw(self.view)
    self.player:draw(self.view)
    for _, entity in ipairs(self.entities) do
        entity:draw(self.view)
    end
    if DEBUG then
        love.graphics.print(self.debugString)
    end
end

function gameState.create(player, view)
    local inst = {}

    inst.updates = 0
    inst.entities = {}
    inst.player = player
    inst.map = Map.create()
    inst.view = view
    inst.dt = 0
    inst.debugString = ""

    inst.addEntity = addEntity
    inst.keyPressed = keyPressed
    inst.modulate = modulate
    inst.update = update
    inst.draw = draw

    return inst
end

return gameState
