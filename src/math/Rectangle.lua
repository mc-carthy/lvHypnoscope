local V = require("src.math.Vector2")

local rectangle = {}

local _overlap = function(min1, min2, max1, max2)
    return min1 < max2 and max1 > min2
end

local update = function(self, x, z)
    self.x = x - self.xOffset
    self.z = z - self.zOffset
end

local overlaps = function(self, other)
    local xOverlap = _overlap(
        self.x, other.x, self.x + self.width, other.x + other.width
    )
    local zOverlap = _overlap(
        self.z, other.z, self.z + self.height, other.z + other.height
    )

    return xOverlap and zOverlap
end

local getPoints = function(self)
    local topLeft = V.worldToScreen({ x = self.x, y = 0, z = self.z })
    local topRight = V.worldToScreen({ x = self.x + self.width, y = 0, z = self.z })
    local bottomLeft = V.worldToScreen({ x = self.x, y = 0, z = self.z + self.height })
    local bottomRight = V.worldToScreen({ x = self.x + self.width, y = 0, z = self.z + self.height })

    return {
        topLeft.x, topLeft.y,
        topRight.x, topRight.y,
        bottomRight.x, bottomRight.y,
        bottomLeft.x, bottomLeft.y
    }
end

rectangle.create = function(x, z, width, height)

    local inst = {}

    inst.xOffset = width / 2
    inst.zOffset = height / 2
    inst.x = x - inst.xOffset
    inst.z = z - inst.zOffset
    inst.width = width
    inst.height = height

    inst.getPoints = getPoints
    inst.overlaps = overlaps
    inst.update = update

    return inst

end

return rectangle
