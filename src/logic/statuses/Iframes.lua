local Status = require("src.logic.Status")

local iframes = {}

iframes.create = function(duration, entity)
    return Status.create(Status.ticks(duration),
    function(_, ent, game)
        ent.vulnerable = true
        ent.iframes = false
    end,
    function()
        entity.vulnerable = false
        entity.iframes = true
    end)
end

return iframes
