local Entity = require("src.logic.Entity")
local SpriteSheet = require("src.graphics.SpriteSheet")
local KeyboardMovement = require("src.logic.ai.movement.KeyboardMovement")
local Punch = require("src.items.Punch")
local Sword = require("src.items.Sword")
local Storm = require("src.spells.Storm")
local Status = require("src.logic.Status")
local Animation = require("src.graphics.Animation")
local Position = require("src.logic.Position")

local player = {}

local playerSprite = SpriteSheet.create("assets/sprites/adventurer.png", 16, Animation.STAND)

local _spawnEntity = function(self, entityToSpawn, game)
    local currentRoom = game.map:currentRoom()
    local pos = self.position
    local offset = 10
    if pos.left then offset = -12 end
    currentRoom:addEntity(entityToSpawn.create(Position.create(pos.x + offset, pos.y, pos.z, pos.left)))
end

local _interruptMovement = function(self)
    local t = Status.create(
        Status.ticks(5),
        function(_, owner, game)
            owner.interruptMovement = false
        end,
        function()
            self.interruptMovement = true
        end
    )
    self:addStatus(t)
end

local action1 = function(self, game)
    local inventory = game:getInventory()
    local itemToSpawn = inventory:getItem()

    _spawnEntity(self, itemToSpawn, game)
    _interruptMovement(self)
end

local stormSpell = Storm.create()

local action2 = function(self, game)
    stormSpell:cast(game)
end

player.create = function()
    local player = Entity.create(playerSprite, Position.create(50, 0, 100), 80, KeyboardMovement)

    player.action1 = action1
    player.action2 = action2

    return player
end

return player
