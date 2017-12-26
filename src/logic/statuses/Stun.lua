local Status = require("src.logic.Status")

local stun = {}

stun.create = function(duration, target)
    local inst = Status.create(
        Status.ticks(duration),
        function()
            target.interruptMovement = false
        end,
        function()
            target.interruptMovement = true
        end,
        nil
    )

    return inst
end

return stun
