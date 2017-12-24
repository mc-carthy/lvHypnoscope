local Punch = require("src.items.Punch")

local inventory = {}

local defaultItem = Punch

local getItem = function(self)
    if self.currentItem == nil then
        return defaultItem
    else
        return self.currentItem
    end
end

local setItem = function(self, item)
    self.currentItem = item
end

inventory.create = function()
    local inst = {}

    inst.currentItem = nil

    inst.getItem = getItem
    inst.setItem = setItem

    return inst
end

return inventory
