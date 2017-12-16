local gameState = {}

local addEntity = function(self, entity)
    table.insert(self.entities, entity)
end

local update = function(self, dt)
    for _, entity in ipairs(self.entities) do
        entity:update(dt, self)
    end
    self.player:update(dt, self)
end

local draw = function(self)
    for _, entity in ipairs(self.entities) do
        entity:draw()
    end
    self.player:draw()
end

function gameState.create(player)
    local inst = {}

    inst.entities = {}
    inst.player = player

    inst.addEntity = addEntity
    inst.update = update
    inst.draw = draw

    return inst
end

return gameState