local spriteSheet = {}

local draw = function(self, view, x, y)
    view:inContext(function()
        local xOffset = self.image:getWidth() / 2
        local yOffset = self.image:getHeight() / 2

        love.graphics.draw(self.image, self.sprites[self.animation:frame()], x - xOffset, y - yOffset)

        if DEBUG then
            love.graphics.rectangle("fill", x, y, 1, 1)
        end
    end)
end

local setAnimation = function(self, newAnimation)
    if newAnimation ~= self.animation then
        self.animation = newAnimation
    end
end

local update = function(self, game)
    self.animation:update(game)
end

spriteSheet.create = function(imagePath, spriteSize, animation)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.sprites = {}
    inst.currentSprite = 2
    inst.animation = animation

    local spritesWide = inst.image:getWidth() / spriteSize
    local spritesHigh = inst.image:getHeight() / spriteSize

    -- TODO expand for spritesheets of more than one row
    inst.maxSprites = spritesWide
    for i = 1, spritesWide do
        inst.sprites[i] = love.graphics.newQuad((i - 1) * spriteSize, 0, spriteSize, spriteSize, inst.image:getDimensions())
    end

    inst.update = update
    inst.draw = draw
    inst.setAnimation = setAnimation

    return inst
end

return spriteSheet
