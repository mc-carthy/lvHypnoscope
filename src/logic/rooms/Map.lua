local Room = require("src.logic.rooms.Room")
local Slime = require("src.mobs.Slime")
local MagicPotion = require("src.pickups.MagicPotion")
local Position = require("src.logic.Position")
local DungeonRoom = require("src.logic.rooms.floorplans.DungeonRoom")
local Bridge = require("src.logic.rooms.floorplans.Bridge")

local map = {}

local currentRoom = function(self)
    return self.rooms[self.roomIndex]
end

local update = function(self, game)
    currentRoom(self):update(game, self)
end

local draw = function(self, view)
    self.rooms[self.roomIndex]:draw(view)
    love.graphics.printf("Room " .. self.roomIndex, love.graphics.getWidth() / 2 - 50, 40, 100, "center")
end

local _createRoom = function()
    local entities = {}

    for i = 1, 5 do
        local xPos = math.random(100) + 100
        local zPos = math.random(50) + 100
        entities[i] = Slime.create(Position.create(xPos, 0, zPos))
    end

    for i = 1, 5 do
        table.insert(entities, MagicPotion.create(Position.create(150 + i * 15, 0, 125)))
    end

    if love.math.random() > 0.5 then
        return Room.create(Bridge, entities)
    else
        return Room.create(DungeonRoom, entities)
    end
end

local nextRoom = function(self, game)
    if self.roomIndex == #self.rooms then
        table.insert(self.rooms, _createRoom())
    end

    local newRoom = self.rooms[self.roomIndex + 1]
    local startPos = newRoom:getEntrance()

    game.player.position:setPosition(
        startPos.x, startPos.y, startPos.z
    )

    self.roomIndex = self.roomIndex + 1
end

local previousRoom = function(self, game)
    if self.roomIndex > 1 then
        self.roomIndex = self.roomIndex - 1

        local newRoom = currentRoom(self)
        local startPos = newRoom:getExit()

        game.player.position:setPosition(
            startPos.x, startPos.y, startPos.z
        )
    end
end

map.create = function ()
    local inst = {}

    inst.roomIndex = 1
    inst.rooms = {}
    inst.rooms[1] = _createRoom()

    inst.nextRoom = nextRoom
    inst.previousRoom = previousRoom
    inst.currentRoom = currentRoom

    inst.update = update
    inst.draw = draw

    return inst
end

return map
