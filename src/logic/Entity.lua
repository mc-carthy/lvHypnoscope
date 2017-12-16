local entity = {}

local update = function(self, dt)
    local moving = false
    if love.keyboard.isDown("right") and not moving then self.x = self.x + self.speed * dt moving = true end
    if love.keyboard.isDown("left") and not moving then self.x = self.x - self.speed * dt moving = true end
    if love.keyboard.isDown("down") and not moving then self.y = self.y + self.speed * dt moving = true end
    if love.keyboard.isDown("up") and not moving then self.y = self.y - self.speed * dt moving = true end
end

local draw = function(self)
    self.sprite:draw(self.x, self.y)
end

function entity.create(sprite, x, y, speed)
    local inst = {}

    inst.sprite = sprite
    inst.x = x
    inst.y = y
    inst.speed = speed

    inst.update = update
    inst.draw = draw

    return inst
end

return entity