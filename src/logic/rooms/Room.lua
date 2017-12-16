local room = {}

local roomWidth = 800
local roomHeight = 600

local draw = function(self)
    love.graphics.push("all")
    love.graphics.setColor(unpack(self.colour))
    love.graphics.rectangle("fill", 0, 0, roomWidth, roomHeight)
    love.graphics.pop()
end

room.create = function ()
    local inst = {}

    inst.colour = {
        math.random(255),
        math.random(255),
        math.random(255)
    }

    inst.draw = draw

    return inst
end

return room