local TileSheet = require("src.graphics.TileSheet")
local Tilemap = require("src.logic.rooms.Tilemap")
local V = require("src.math.Vector2")

local room = {}

local walkable = function(self, x, z)
    local screenPos = V.worldToScreen({ x = x, y = 0, z = z })
    if screenPos.x < 0 or screenPos.y < 0 then return false end

    local tileChar = self.tilemap:getTile(screenPos.x, screenPos.y, self.tilesheet.tileSize)
    return (tileChar == "," or tileChar == ".")
end

local update = function(self, game, map)
    for _, entity in ipairs(self.entities) do
        entity:update(game)
    end

    if game.player.drawX > self.roomWidth - self.tilesheet.tileSize then
        map:nextRoom(game)
    end

    if game.player.drawX < self.tilesheet.tileSize then
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

    inst.tilesheet = TileSheet.create("assets/sprites/tiles/dungeonPalette.png", 8)
    inst.tilemap = Tilemap.create()

    inst.roomWidth = 50 * inst.tilesheet.tileSize
    inst.roomHeight = 22 * inst.tilesheet.tileSize
    inst.entranceX = -90
    inst.entranceZ = 150
    inst.exitX = 275
    inst.exitZ = 150

    inst.colour = {
        math.random(255),
        math.random(255),
        math.random(255)
    }

    inst.entities = entities

    inst.walkable = walkable
    inst.update = update
    inst.draw = draw

    return inst
end

return room
