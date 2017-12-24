local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local Status = require("src.logic.Status")
local RemoveSelf = require("src.logic.statuses.RemoveSelf")
local Knockback = require("src.logic.statuses.Knockback")

local punch = {}

local punchSprite = Sprite.create("assets/sprites/punch.png")
local punchSfx = love.audio.newSource("assets/sounds/punch.wav", "static")

local collision = function(self, other, game)
    if game.player ~= other then
        other:takeDamage(1)
        local duration = 20
        local strength = 6
        other:addStatus(Knockback.create(duration, other, self.position, strength))
    end
end

local speed = 0
local movement = nil

punch.create = function(pos)
    local punch = Entity.create(punchSprite, pos, speed, movement, collision)
    love.audio.play(punchSfx)

    punch:addStatus(RemoveSelf.create(6))

    return punch
end

return punch
