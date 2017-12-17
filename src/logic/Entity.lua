local entity = {}

local update = function(self, game)
    self.movement.update(self, game)
    local theta = math.rad(45)
    self.drawX = self.x + 0.5 * self.z * math.cos(theta)
    self.drawY = self.y + 0.5 * self.z * math.sin(theta)
end

local draw = function(self, view)
    self.sprite:draw(view, self.drawX, self.drawY)
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
