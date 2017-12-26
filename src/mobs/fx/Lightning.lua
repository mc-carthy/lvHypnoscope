local Entity = require("src.logic.Entity")
local TiledSprite = require("src.graphics.TiledSprite")
local RemoveSelf = require("src.logic.statuses.RemoveSelf")

local lightning = {}

local sprite = TiledSprite.create("assets/sprites/lightning.png", 1, 4)

lightning.create = function(pos, duration)
    local inst = Entity.create(sprite, pos)

    inst:addStatus(RemoveSelf.create(duration))

    return inst
end

return lightning
