local Entity = require("src/logic/Entity")
local Sprite = require("src/graphics/Sprite")

local punch = {}

local punchSprite = Sprite.create("assets/sprites/punch.png")

punch.create = function(x, y, z)
    local punch = Entity.create(punchSprite, x, y, z, 0)

    return punch
end

return punch
