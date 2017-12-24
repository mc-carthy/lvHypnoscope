local View = require("src.graphics.View")

local sprite = {}

local getImage = function(self)
    return self.image
end

local draw = function(self, view, x, y, flipped)
    view:inContext(function()
        local xOffset = self.size / 2
        local yOffset = self.size / 2
        local xScale = 1
        if flipped then xScale = -1 end

        love.graphics.draw(self.image, x, y, 0, xScale, 1, xOffset, yOffset)

        if DEBUG then
            love.graphics.rectangle("fill", x, y, 1, 1)
        end
    end)
end

function sprite.create(imagePath)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.draw = draw
    inst.getImage = getImage
    inst.size = inst.image:getWidth()

    return inst
end

return sprite
