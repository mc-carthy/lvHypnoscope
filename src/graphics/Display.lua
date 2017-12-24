local display = {}

local _drawBar = function(n, pipWidth, pipHeight, xOffset, yOffset)
    love.graphics.setColor(0, 191, 0)

    for i = 0, n do
        love.graphics.rectangle("fill", i * pipWidth + xOffset, yOffset, pipWidth, pipHeight)
    end

    love.graphics.setColor(255, 255, 255)
end

local draw = function(self, view, game)
    view:inDisplayContext(function()
        local player = game:getPlayer()

        local pipWidth = 6
        local pipHeight = 4
        local xOffset = 4
        local yOffset = 2

        _drawBar(player.hp, pipWidth, pipHeight, xOffset, yOffset)
    end)
end

display.create = function()
    local inst = {}

    inst.draw = draw

    return inst
end

return display
