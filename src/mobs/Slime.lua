local Sprite = require("src.graphics.Sprite")
local Entity = require("src.logic.Entity")
local FollowPlayer = require("src.logic.ai.movement.FollowPlayer")

local Slime = {}

local slimeSprite = Sprite.create("assets/sprites/slime.png")
local speed = 1

Slime.create = function(xPos, yPos, zPos)
    return Entity.create(slimeSprite, xPos, yPos, zPos, speed, FollowPlayer)
end

return Slime
