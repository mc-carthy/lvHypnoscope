local display = {}

local _drawBar = function(n, pipWidth, pipHeight, xOffset, yOffset, colour)
    love.graphics.setColor(colour)

    for i = 0, (n - 1) do
        love.graphics.rectangle("fill", i * pipWidth + xOffset, yOffset, pipWidth, pipHeight)
    end

    love.graphics.setColor(255, 255, 255)
end

local draw = function(self, view, game)
    view:inDisplayContext(function()
        local inventory = game:getInventory()

        local player = game:getPlayer()
        local pipWidth = 6
        local pipHeight = 3
        local xOffset = 4
        local yOffset = 2
        local healthColour = { 0, 191, 0 }
        _drawBar(player.hp, pipWidth, pipHeight, xOffset, yOffset, healthColour)

        local potionColour = { 191, 0, 191 }
        _drawBar(inventory.potionCount, pipWidth, pipHeight, xOffset, yOffset + pipHeight, potionColour)


        local item = inventory:getItem()
        local itemIconPositionX = 270 - 8 - 2
        local itemIconPositionY = 1
        love.graphics.draw(item.SPRITE:getImage(), itemIconPositionX, itemIconPositionY)
    end)
end

display.create = function()
    local inst = {}

    inst.draw = draw

    return inst
end

return display
