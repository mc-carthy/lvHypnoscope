local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local Timer = require("src.logic.Timer")

local punch = {}

local punchSprite = Sprite.create("assets/sprites/punch.png")
local punchSfx = love.audio.newSource("assets/sounds/punch.wav", "static")

local collision = function(self, other, game)
    if game.player ~= other then
        other:takeDamage(1)
    end
end

punch.create = function(x, y, z)
    local punch = Entity.create(punchSprite, x, y, z, 0, nil, collision)
    love.audio.play(punchSfx)

    local t = Timer.create(6, function(t, ent, game)
        ent:done()
    end)

    punch:addTimer(t)

    return punch
end

return punch
