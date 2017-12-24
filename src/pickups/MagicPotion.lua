local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")

local magicPotion = {}

local potionSprite = Sprite.create("assets/sprites/magic_potion.png")
local potionSfx = love.audio.newSource("assets/sounds/potion_plink.wav", "static")

local collision = function(self, other, game)
    if other == game.player then
        potionSfx:play()
        local inventory = game:getInventory()
        inventory:addPotion()
        self:done()
    end
end

local done = function(self)
    self.finished = true
end

magicPotion.create = function(pos)
    local inst = Entity.create(
        potionSprite,
        pos,
        0,
        nil,
        collision
    )

    inst.done = done

    return inst
end

return magicPotion
