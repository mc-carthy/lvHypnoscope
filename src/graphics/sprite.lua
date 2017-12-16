local sprite = {}

local draw = function(self, x, y)
    love.graphics.draw(self.image, x, y, 0, 5, 5)
end

function sprite.create(imagePath)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.draw = draw

    return inst
end

return sprite