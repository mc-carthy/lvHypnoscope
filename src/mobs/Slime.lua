local Sprite = require("src.graphics.Sprite")
local Entity = require("src.logic.Entity")
local BounceAfterPlayer = require("src.logic.ai.movement.BounceAfterPlayer")

local Slime = {}

local slimeSprite = Sprite.create("assets/sprites/slime.png")
local speed = 32

Slime.create = function(xPos, yPos, zPos)
    return Entity.create(slimeSprite, xPos, yPos, zPos, speed, BounceAfterPlayer)
end

return Slime
