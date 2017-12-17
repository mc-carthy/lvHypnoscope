local Room = require("src.logic.rooms.Room")
local Slime = require("src.mobs.Slime")

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
        local xPos = math.random(800)
        local yPos = math.random(600)
        entities[i] = Slime.create(xPos, yPos)
    end

    return Room.create(entities)
end

local nextRoom = function(self, game)
    if self.roomIndex == #self.rooms then
        table.insert(self.rooms, _createRoom())
    end

    game.player.x = 8 + 1

    self.roomIndex = self.roomIndex + 1
end

local previousRoom = function(self, game)
    if self.roomIndex > 1 then
        self.roomIndex = self.roomIndex - 1
        game.player.x = currentRoom(self).roomWidth - (8 + 1)
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
