local Status = require("src.logic.Status")

local removeSelf = {}

removeSelf.create = function(duration)
    local inst = Status.create(
        Status.ticks(duration),
        function(_, owner, game)
            owner:done()
        end
    )

    return inst
end

return removeSelf
