local TileSheet = require("src.graphics.TileSheet")
local Tilemap = require("src.logic.rooms.Tilemap")

local room = {}

local update = function(self, game, map)
    for _, entity in ipairs(self.entities) do
        entity:update(game)
    end

    if game.player.x > self.roomWidth then
        map:nextRoom(game)
    end

    if game.player.x < 0 then
        map:previousRoom(game)
    end
end

local draw = function(self, view)
    self.tilemap:draw(view, self.tilesheet)



    for _, entity in ipairs(self.entities) do
        entity:draw(view)
    end
end

room.create = function (entities)
    local inst = {}

    inst.tilesheet = TileSheet.create("assets/sprites/tiles/numbers.png", 8)
    inst.tilemap = Tilemap.create()

    inst.roomWidth = 50 * inst.tilesheet.tileSize
    inst.roomHeight = 22 * inst.tilesheet.tileSize

    inst.colour = {
        math.random(255),
        math.random(255),
        math.random(255)
    }

    inst.entities = entities

    inst.update = update
    inst.draw = draw

    return inst
end

return room
