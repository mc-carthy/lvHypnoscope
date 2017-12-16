local gameState = {}

local addEntity = function(self, entity)
    table.insert(self.entities, entity)
end

local update = function(self, dt)
    for _, entity in ipairs(self.entities) do
        entity:update(dt)
    end
end

local draw = function(self)
    for _, entity in ipairs(self.entities) do
        entity:draw()
    end
end

function gameState.create()
    local inst = {}

    inst.entities = {}

    inst.addEntity = addEntity
    inst.update = update
    inst.draw = draw

    return inst
end

return gameState