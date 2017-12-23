local Room = require("src.logic.rooms.Room")
local Slime = require("src.mobs.Slime")
local MagicPotion = require("src.pickups.MagicPotion")
local Position = require("src.logic.Position")
local Random = require("src.math.Random")
local DungeonRoom = require("src.logic.rooms.floorplans.DungeonRoom")
local Bridge = require("src.logic.rooms.floorplans.Bridge")

local map = {}

local tilemaps = { DungeonRoom, Bridge }

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
    local tilemap = Random.pick(tilemaps)
    local availablePositions = tilemap:getWalkablePositions(8)

    for i = 1, 5 do
        local pos = Random.pick(availablePositions)
        entities[i] = Slime.create(Position.create(pos[1], 0, pos[2]))
    end

    for i = 1, 5 do
        table.insert(entities, MagicPotion.create(Position.create(150 + i * 15, 0, 125)))
    end

    return Room.create(tilemap, entities)
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
