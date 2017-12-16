local View = require("src.graphics.View")

local sprite = {}

local draw = function(self, view, x, y)
    view:inContext(function()
        love.graphics.draw(self.image, x, y, 0)
    end)
end

function sprite.create(imagePath)
    local inst = {}

    inst.image = love.graphics.newImage(imagePath)
    inst.image:setFilter("nearest", "nearest")
    inst.draw = draw

    return inst
end

return sprite
