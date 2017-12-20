local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")

local magicPotion = {}

local potionSprite = Sprite.create("assets/sprites/magic_potion.png")
local potionSfx = love.audio.newSource("assets/sounds/potion_plink.wav", "static")

local collision = function(self, other, game)
    print("Magic Potion Collision!")
    if other == game.player then
        potionSfx:play()
    end
end

magicPotion.create = function(x, y, z)
    local inst = Entity.create(
        potionSprite,
        x, y, z,
        0,
        nil,
        collision
    )

    return inst
end

return magicPotion