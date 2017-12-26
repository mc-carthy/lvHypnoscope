local Punch = require("src.items.Punch")

local inventory = {}

local defaultItem = Punch

local addPotion = function(self)
    self.potionCount = self.potionCount + 1
end

local getPotionCount = function(self)
    return self.potionCount
end

local setPotionCount = function(self, n)
    self.potionCount = n
end

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
    inst.potionCount = 0

    inst.getItem = getItem
    inst.setItem = setItem
    inst.addPotion = addPotion
    inst.getPotionCount = getPotionCount
    inst.setPotionCount = setPotionCount

    return inst
end

return inventory
