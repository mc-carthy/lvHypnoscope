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
    view:inContext(function()
        love.graphics.setColor(unpack(self.colour))
        love.graphics.rectangle("fill", 0, 0, self.roomWidth, self.roomHeight)
    end)


    for _, entity in ipairs(self.entities) do
        entity:draw(view)
    end
end

room.create = function (entities)
    local inst = {}


    inst.roomWidth = 300
    inst.roomHeight = 560

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
