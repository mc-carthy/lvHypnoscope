local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")

local magicPotion = {}

local potionSprite = Sprite.create("assets/sprites/magic_potion.png")

magicPotion.create = function(x, y, z)
    local inst = Entity.create(
        potionSprite,
        x, y, z,
        0,
        nil
    )

    return inst
end

return magicPotion
