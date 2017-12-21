local Vector2 = require("src.math.Vector2")
local Rectangle = require("src.math.Rectangle")

local entity = {}

local collisionCheck = function(self, other, game)
    if self == other then return end
    if self.boundingBox:overlaps(other.boundingBox) then
        self.debugColour = { 191, 0, 0 }
        if self.collision then self:collision(other, game) end
    end
end

local toPosition = function(self)
    return {
        x = self.x,
        y = self.y,
        z = self.z
    }
end

local _positionString = function(self)
    return math.floor(self.x) .. ", " .. math.floor(self.y) .. ", " .. math.floor(self.z)
end

local update = function(self, game)
    if self.timer then self.timer:tick(self, game) end
    if self.movement then self.movement.update(self, game) end
    self.boundingBox:update(self.x, self.z)
    local screenPos = Vector2.worldToScreen(toPosition(self))
    self.drawX = screenPos.x
    self.drawY = screenPos.y
end

local draw = function(self, view)
    self.sprite:draw(view, self.drawX, self.drawY)
    if DEBUG then
        view:inContext(function()
            love.graphics.print(_positionString(self), self.drawX, self.drawY)
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

function entity.create(sprite, x, y, z, speed, movement, collision)
    local inst = {}

    inst.finished = false
    inst.sprite = sprite
    inst.x = x
    inst.y = y
    inst.z = z
    inst.drawX = x
    inst.drawY = y - z / 2
    inst.speed = speed
    inst.movement = movement
    inst.collision = collision

    inst.boundingBox = Rectangle.create(
        x,
        z,
        sprite.image:getWidth(),
        sprite.image:getHeight()
    )

    inst.update = update
    inst.draw = draw
    inst.done = done
    inst.toPosition = toPosition
    inst.collisionCheck = collisionCheck
    inst.addTimer = addTimer
    inst.removeTimer = removeTimer

    return inst
end

return entity
