local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")

local player = {}

local playerSprite = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)

player.create = function()
    local player = Entity.create(playerSprite, 50, 0, 100, 80, KeyboardMovement)

    return player
end

return player
