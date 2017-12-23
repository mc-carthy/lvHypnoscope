local Vector2 = require("src.math.Vector2")

local position = {}

local toString = function(self)
    return math.floor(self.x) .. ", " .. math.floor(self.y) .. ", " .. math.floor(self.z)
end

local _updateDrawPosition = function(self)
    local drawPosition = Vector2.worldToScreen(
        { x = self.x, y = self.y, z = self.z }
    )
    self.drawX = drawPosition.x
    self.drawY = drawPosition.y
end

local update = function(self, x, y, z)
    self.x = x
    self.y = y
    self.z = z
    _updateDrawPosition(self)
end

position.create = function(x, y, z)
    local inst = {}

    inst.x = x
    inst.y = y
    inst.z = z
    inst.drawX = nil
    inst.drawY = nil
    _updateDrawPosition(inst)

    inst.toString = toString
    inst.update = update

    return inst
end

return position
