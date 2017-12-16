local sprite = {}

local draw = function(self)
    love.graphics.draw(self.image, self.x, self.y, 0, self.xScale, self.yScale)
end

function sprite.create(imagePath, x, y, xScale, yScale)
    local inst = {}

    inst.x = x
    inst.y = y
    inst.xScale = xScale
    inst.yScale = yScale
    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.draw = draw

    return inst
end

return sprite