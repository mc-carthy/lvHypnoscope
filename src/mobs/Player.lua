local Entity = require("src.logic.Entity")
local Sprite = require("src.graphics.Sprite")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local Punch = require("src.items.Punch")
local Timer = require("src.logic.Timer")

local player = {}

local playerSprite = Sprite.create("assets/sprites/adventurer.png", 0, 0, 4, 4)

local action1 = function(self, game)
    local currentRoom = game.map:currentRoom()
    -- TODO: Replace hard-coded value below, half sprite width
    currentRoom:addEntity(Punch.create(self.x + 8, self.y, self.z))
    self.interruptMovement = true
    local t = Timer.create(5, function(_, owner, game)
        owner.interruptMovement = false
    end)
    self:addTimer(t)
end

player.create = function()
    local player = Entity.create(playerSprite, 50, 0, 100, 80, KeyboardMovement)

    player.action1 = action1

    return player
end

return player
