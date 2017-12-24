local Entity = require("src.logic.Entity")

local item = {}

local collision = function(self, other, game)
    if other == game:getPlayer() then
        local inventory = game:getInventory()
        inventory:setItem(self.__item)
        self:done()
    end
end

item.create = function(pos, itemClass)
    local speed = 0
    local movement = nil
    local inst = Entity.create(itemClass.SPRITE, pos, speed, movement, collision)

    inst.__item = itemClass

    return inst
end

return item
