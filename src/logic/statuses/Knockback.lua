local Status = require("src.logic.Status")
local Vector2 = require("src.math.Vector2")

local knockback = {}

knockback.create = function(duration, entity, targetPos, strength)
    return Status.create(Status.ticks(duration), nil, nil, function(self, owner, game)
        local entityPos = entity.position
        local unitVector = Vector2.normalise(targetPos, entityPos)
        local dx = unitVector.x * strength * game.dt
        local dz = unitVector.z * strength * game.dt
        local newX = entityPos.x + dx
        local newZ = entityPos.z + dz

        entity.position:setPosition(newX, entityPos.y, newZ)
    end)
end

return knockback
