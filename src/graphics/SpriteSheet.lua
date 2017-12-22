local spriteSheet = {}

local draw = function(self, view, x, y)
    view:inContext(function()
        local xOffset = self.image:getWidth() / 2
        local yOffset = self.image:getHeight() / 2

        love.graphics.draw(self.image, self.sprites[self.currentSprite], x - xOffset, y - yOffset)

        if DEBUG then
            love.graphics.rectangle("fill", x, y, 1, 1)
        end
    end)
end

local update = function(self, game)
    self.frameCount = self.frameCount + game.dt
    if self.frameCount > self.frameTime then
        self.frameCount = 0
        self.currentSprite = self.currentSprite + 1
        if self.currentSprite > self.maxSprites then self.currentSprite = 1 end
    end
end

spriteSheet.create = function(imagePath, spriteSize)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.sprites = {}
    inst.currentSprite = 2
    inst.frameTime = 15 * (1 / 60)
    inst.frameCount = 0

    local spritesWide = inst.image:getWidth() / spriteSize
    local spritesHigh = inst.image:getHeight() / spriteSize

    -- TODO expand for spritesheets of more than one row
    inst.maxSprites = spritesWide
    for i = 1, spritesWide do
        inst.sprites[i] = love.graphics.newQuad((i - 1) * spriteSize, 0, spriteSize, spriteSize, inst.image:getDimensions())
    end

    inst.update = update
    inst.draw = draw

    return inst
end

return spriteSheet
