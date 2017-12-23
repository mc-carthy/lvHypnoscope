local Rectangle = require("src.math.Rectangle")
local Timer = require("src.logic.Timer")

local entity = {}

local collisionCheck = function(self, other, game)
    if self == other then return end
    if self.boundingBox:overlaps(other.boundingBox) then
        self.debugColour = { 191, 0, 0 }
        if self.collision then self:collision(other, game) end
    end
end

local update = function(self, game)
    if self.iframes and game:modulate() then
        self.visible = false
    else
        self.visible = true
    end
    if self.timer then self.timer:tick(self, game) end
    if self.movement then self.movement.update(self, game) end
    if self.sprite.update then self.sprite:update(game) end
    self.boundingBox:update(self.position.x, self.position.z)
end

local draw = function(self, view)
    if self.visible then
        self.sprite:draw(view, self.position.drawX, self.position.drawY, self.position.left)
    end
    if DEBUG then
        view:inContext(function()
            love.graphics.print(self.position:toString(), self.position.drawX, self.position.drawY)
            if self.debugColour then love.graphics.setColor(self.debugColour) end
            love.graphics.polygon("line", self.boundingBox:getPoints())
        end)
    end
end

local done = function (self)
  self.finished = true
end

local addTimer = function(self, timer)
    self.timer = timer
end

local removeTimer = function(self)
    self.timer = nil
end

local takeDamage = function(self, damage)
    if self.vulnerable then
        self.hp = self.hp - damage
        if self.hp <= 0 then
            self:done()
        else
            self.vulnerable = false
            self.iframes = true
            self:addTimer(Timer.create(Timer.ticks(20), function(self, entity, game)
                entity.vulnerable = true
                entity.iframes = false
            end))
        end
    end
end

function entity.create(sprite, position, speed, movement, collision)
    local inst = {}

    inst.finished = false
    inst.sprite = sprite
    inst.position = position
    inst.vulnerable = true
    inst.hp = 5
    inst.speed = speed
    inst.movement = movement
    inst.collision = collision
    inst.interruptMovement = false
    inst.iframes = false
    inst.visible = true

    inst.boundingBox = Rectangle.create(
        inst.position.x,
        inst.position.z,
        sprite.size,
        sprite.size
    )

    inst.update = update
    inst.draw = draw
    inst.done = done
    inst.toPosition = toPosition
    inst.collisionCheck = collisionCheck
    inst.takeDamage = takeDamage
    inst.addTimer = addTimer
    inst.removeTimer = removeTimer

    return inst
end

return entity
