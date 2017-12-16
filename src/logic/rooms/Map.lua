local Room = require("src.logic.rooms.Room")

local map = {}

local update = function(self, game)
    self.rooms[self.roomIndex]:update(game, self)
end

local draw = function(self)
    self.rooms[self.roomIndex]:draw()
    love.graphics.printf("Room " .. self.roomIndex, love.graphics.getWidth() / 2 - 50, 40, 100, "center")
end

local _createRoom = function()
    return Room.create()
end

local nextRoom = function(self, game)
    if self.roomIndex == #self.rooms then
        table.insert(self.rooms, _createRoom())
    end

    game.player.x = 5

    self.roomIndex = self.roomIndex + 1
end

local previousRoom = function(self, game)
    if self.roomIndex > 1 then
        self.roomIndex = self.roomIndex - 1
        game.player.x = 790
    end
end

map.create = function ()
    local inst = {}

    inst.roomIndex = 1
    inst.rooms = {}
    inst.rooms[1] = Room.create()

    inst.nextRoom = nextRoom
    inst.previousRoom = previousRoom

    inst.update = update
    inst.draw = draw

    return inst
end

return map
