local storm = {}

local cast = function(self, game)
    local room = game.map:currentRoom()

    for _, mob in ipairs(room:getEntities()) do
        if mob.is == "enemy" then
            mob:takeDamage(self.spellDamage)
        end
    end
end

storm.create = function()
    local inst = {}

    inst.spellDamage = 10

    inst.cast = cast

    return inst
end

return storm
