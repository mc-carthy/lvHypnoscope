local Sprite = require("src.graphics.Sprite")
local Entity = require("src.logic.Entity")
local BounceAfterPlayer = require("src.logic.ai.movement.BounceAfterPlayer")

local slime = {}

local slimeSprite = Sprite.create("assets/sprites/slime.png")
local speed = 32

local collision = function(self, other, game)
    if game.player == other then
        game.player:takeDamage(1)
    end
end

slime.create = function(pos)
    return Entity.create(slimeSprite, pos, speed, BounceAfterPlayer, collision)
end

return slime
