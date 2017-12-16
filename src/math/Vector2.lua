local sqrt = math.sqrt
local pow = math.pow

local vector2 = {}

vector2.distance = function(from, to)
    dx = to.x - from.x
    dy = to.y - from.y
    return sqrt(pow(dx, 2) + pow(dy, 2))
end

vector2.normalise = function(from, to)
    local dx = to.x - from.x
    local dy = to.y - from.y
    local dst = vector2.distance(from, to)

    return {
        x = dx / dst,
        y = dy / dst
    }
end

return vector2