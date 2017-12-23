local View = {}

local clamp = function(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

local viewOffset = 0

local update = function(self, game)
    local currentRoom = game.map:currentRoom()
    local maxX = (currentRoom.roomWidth - self.gameWidth) + viewOffset
    -- local maxY = (currentRoom.roomHeight - self.gameHeight) + viewOffset
    self.x = clamp(game.player.position.drawX - self.gameWidth / 2, -viewOffset, maxX)
    -- self.y = clamp(game.player.position.drawY - self.gameHeight / 2, -viewOffset, maxY)
end

local scale = function(self)
    return love.graphics.getWidth() / self.gameWidth
end

local inContext = function(self, drawFunction)
    local scale = scale(self)
    love.graphics.push("all")
    love.graphics.scale(scale, scale)
    love.graphics.translate(-self.x, -self.y)
    drawFunction()
    love.graphics.pop()
end

local inBackgroundContext = function(self, drawFunction)
    local scale = scale(self)
    love.graphics.push("all")
    love.graphics.scale(scale, scale)
    drawFunction()
    love.graphics.pop()
end

View.create = function(gameWidth, gameHeight, x, y)
    local inst = {}

    inst.gameWidth = gameWidth
    inst.gameHeight = gameHeight
    inst.x = x
    inst.y = y

    inst.inContext = inContext
    inst.inBackgroundContext = inBackgroundContext
    inst.update = update

    return inst
end

return View
