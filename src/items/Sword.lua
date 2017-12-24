local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local RemoveSelf = require("src.logic.statuses.RemoveSelf")
local Knockback = require("src.logic.statuses.Knockback")

local sword = {}

local sprite = Sprite.create("assets/sprites/sword.png")
local sfx = love.audio.newSource("assets/sounds/sword.wav", "static")

local speed = 0
local movement = nil

local collision = function(self, other, game)
    if game.player ~= other then
        other:takeDamage(5)
        local duration = 10
        local strength = 8
        other:addStatus(Knockback.create(duration, other, self.position, strength))
    end
end

sword.create = function(pos)
    local inst = Entity.create(sprite, pos, speed, movement, collision)
    sfx:play()
    inst:addStatus(RemoveSelf.create(6))

    return inst
end

return sword
