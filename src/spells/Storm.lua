local Stun = require("src.logic.statuses.Stun")
local Lightning = require("src.mobs.fx.Lightning")

local storm = {}

local sfx = love.audio.newSource("assets/sounds/storm.wav", "static")
local nopeSfx = love.audio.newSource("assets/sounds/nope.wav", "static")

local cast = function(self, game)
    local room = game.map:currentRoom()
    local inventory = game:getInventory()
    local potionCount = inventory:getPotionCount()
    local stunTime = 50

    if potionCount >= self.spellCost then
        sfx:play()
        inventory:setPotionCount(potionCount - self.spellCost)
        for _, mob in ipairs(room:getEntities()) do
            if mob.is == "enemy" then
                mob:takeDamage(self.spellDamage)
                mob:addStatus(Stun.create(stunTime, mob))
                room:addEntity(Lightning.create(mob:getPosition(), stunTime))
            end
        end
    else
        nopeSfx:play()
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
