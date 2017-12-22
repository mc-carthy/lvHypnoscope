local Entity = require("src.logic.Entity")
local SpriteSheet = require("src.graphics.SpriteSheet")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local Punch = require("src.items.Punch")
local Timer = require("src.logic.Timer")

local player = {}

local playerSprite = SpriteSheet.create("assets/sprites/adventurer.png", 16)

local action1 = function(self, game)
    local currentRoom = game.map:currentRoom()
    -- TODO: Replace hard-coded value below, half sprite width
    currentRoom:addEntity(Punch.create(self.x + 8, self.y, self.z))
    self.interruptMovement = true
    local t = Timer.create(Timer.ticks(5), function(_, owner, game)
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
