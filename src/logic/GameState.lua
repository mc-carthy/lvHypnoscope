local Map = require("src.logic.rooms.Map")
local Inventory = require("src.logic.Inventory")
local Display = require("src.graphics.Display")

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
    if key == "x" then
        self.player:action2(self)
    end
end

local update = function(self, dt)
    self.updates = self.updates + 1
    self.dt = dt
    self.map:update(self)

    for i, entity in ipairs(self.entities) do
        if entity.finished then
            table.remove(self.entities, i)
        end
    end

    for _, entity in ipairs(self.entities) do
        entity:update(self)
    end
    self.view:update(self)
end

local draw = function(self)
    self.map:draw(self.view)
    for _, entity in ipairs(self.entities) do
        entity:draw(self.view)
    end

    self.display:draw(self.view, self)

    if DEBUG then
        love.graphics.print(self.debugString)
        love.graphics.print(self.player.hp, 10, 10)
    end
end

local getInventory = function(self)
    return self.inventory
end

local getPlayer = function(self)
    return self.player
end

function gameState.create(player, view)
    local inst = {}

    inst.updates = 0
    inst.entities = { player }
    inst.player = player
    inst.display = Display.create()
    inst.inventory = Inventory.create()
    inst.map = Map.create()
    inst.view = view
    inst.dt = 0
    inst.debugString = ""

    inst.addEntity = addEntity
    inst.keyPressed = keyPressed
    inst.modulate = modulate
    inst.getInventory = getInventory
    inst.getPlayer = getPlayer
    inst.update = update
    inst.draw = draw

    return inst
end

return gameState
