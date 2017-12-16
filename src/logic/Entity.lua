local entity = {}

local update = function(self, dt)
    if love.keyboard.isDown("right") then self.x = self.x + self.speed * dt end
    if love.keyboard.isDown("left") then self.x = self.x - self.speed * dt end
    if love.keyboard.isDown("down") then self.y = self.y + self.speed * dt end
    if love.keyboard.isDown("up") then self.y = self.y - self.speed * dt end
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