local tiledSprite = {}

local draw = function(self, view, x, y, flipped)
    view:inContext(function()
        love.graphics.draw(self.image, self.quad, x - self.xOffset, y - self.yOffset)
    end)
end

tiledSprite.create = function(imagePath, repeatX, repeatY)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.image:setWrap("repeat", "repeat")

    local width = inst.image:getWidth()
    local height = inst.image:getHeight()
    inst.quad = love.graphics.newQuad(0, 0, width * repeatX, height * repeatY, inst.image:getDimensions())
    inst.size = width
    inst.xOffset = width / 2
    inst.yOffset = height * repeatY

    inst.draw = draw

    return inst
end

return tiledSprite
