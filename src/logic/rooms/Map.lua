local Room = require("src.logic.rooms.Room")
local Slime = require("src.mobs.Slime")
local MagicPotion = require("src.pickups.MagicPotion")

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
        entities[i] = Slime.create(xPos, 0, zPos)
    end

    table.insert(entities, MagicPotion.create(150, 0, 125))

    return Room.create(entities)
end

local nextRoom = function(self, game)
    if self.roomIndex == #self.rooms then
        table.insert(self.rooms, _createRoom())
    end

    local newRoom = self.rooms[self.roomIndex + 1]

    game.player.x = newRoom.entranceX
    game.player.z = newRoom.entranceZ

    self.roomIndex = self.roomIndex + 1
end

local previousRoom = function(self, game)
    if self.roomIndex > 1 then
        self.roomIndex = self.roomIndex - 1
        local newRoom = currentRoom(self)
        game.player.x = newRoom.exitX
        game.player.z = newRoom.exitZ
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
