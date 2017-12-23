local Entity = require("src.logic.Entity")
local SpriteSheet = require("src.graphics.SpriteSheet")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local Punch = require("src.items.Punch")
local Timer = require("src.logic.Timer")
local Animation = require("src.graphics.Animation")
local Position = require("src.logic.Position")

local player = {}

local playerSprite = SpriteSheet.create("assets/sprites/adventurer.png", 16, Animation.STAND)

local action1 = function(self, game)
    local currentRoom = game.map:currentRoom()
    local pos = self.position
    -- TODO: Replace hard-coded values below
    local punchOffset = 10
    if pos.left then punchOffset = -12 end
    currentRoom:addEntity(Punch.create(Position.create(pos.x + punchOffset, pos.y, pos.z, pos.left)))
    self.interruptMovement = true
    local t = Timer.create(Timer.ticks(5), function(_, owner, game)
        owner.interruptMovement = false
    end)
    self:addTimer(t)
end

player.create = function()
    local player = Entity.create(playerSprite, Position.create(50, 0, 100), 80, KeyboardMovement)

    player.action1 = action1

    return player
end

return player
