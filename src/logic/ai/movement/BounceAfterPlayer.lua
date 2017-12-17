local FollowPlayer = require("src.logic.ai.movement.FollowPlayer")
local Bounce = require("src.logic.ai.movement.Bounce")

local bounceAfterPlayer = {}

bounceAfterPlayer.update = function(entity, game)
    FollowPlayer.update(entity, game)
    Bounce.update(entity, game)
end

return bounceAfterPlayer
