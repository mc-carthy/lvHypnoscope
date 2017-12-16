local entity = {}

local update = function(self, dt, game)
    self.movement.update(self, dt, game)
    self.drawX = self.x
    self.drawY = self.y - self.z / 2
end

local draw = function(self)
    self.sprite:draw(self.drawX, self.drawY)
end

local toPosition = function(self)
    return {
        x = self.x,
        y = self.y,
        z = self.z
    }
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