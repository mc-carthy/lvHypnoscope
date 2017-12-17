local Vector2 = require("src.math.Vector2")

local entity = {}

local toPosition = function(self)
    return {
        x = self.x,
        y = self.y,
        z = self.z
    }
end

local update = function(self, game)
    self.movement.update(self, game)
    local screenPos = Vector2.worldToScreen(toPosition(self))
    self.drawX = screenPos.x
    self.drawY = screenPos.y
end

local draw = function(self, view)
    self.sprite:draw(view, self.drawX, self.drawY)
end

function entity.create(sprite, x, y, z, speed, movement)
    local inst = {}

    inst.sprite = sprite
    inst.x = x
    inst.y = y
    inst.z = z
    inst.drawX = x
    inst.drawY = y - z / 2
    inst.speed = speed
    inst.movement = movement

    inst.update = update
    inst.draw = draw
    inst.toPosition = toPosition

    return inst
end

return entity
