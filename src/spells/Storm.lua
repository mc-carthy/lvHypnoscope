local storm = {}

local sfx = love.audio.newSource("assets/sounds/storm.wav", "static")

local cast = function(self, game)
    local room = game.map:currentRoom()
    local inventory = game:getInventory()

    if inventory:getPotionCount() > self.spellCost then
        sfx:play()
        inventory:setPotionCount(inventory:getPotionCount() - self.spellCost)
        for _, mob in ipairs(room:getEntities()) do
            if mob.is == "enemy" then
                mob:takeDamage(self.spellDamage)
            end
        end
    end

end

storm.create = function()
    local inst = {}

    inst.spellDamage = 3
    inst.spellCost = 2

    inst.cast = cast

    return inst
end

return storm
