local room = {}

local roomWidth = 800
local roomHeight = 600

local update = function(self, game, map)
    for _, entity in ipairs(self.entities) do
        entity:update(game)
    end

    if game.player.x > roomWidth then
        map:nextRoom(game)
    end

    if game.player.x < 0 then
        map:previousRoom(game)
    end
end

local draw = function(self)
    love.graphics.push("all")
    love.graphics.setColor(unpack(self.colour))
    love.graphics.rectangle("fill", 0, 0, roomWidth, roomHeight)
    love.graphics.pop()

    for _, entity in ipairs(self.entities) do
        entity:draw()
    end
end

room.create = function (entities)
    local inst = {}

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
