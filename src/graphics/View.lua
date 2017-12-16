local View = {}

local update = function(self, game)
    self.x = game.player.x - self.gameWidth / 2
    self.y = game.player.y - self.gameHeight / 2
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

View.create = function(gameWidth, gameHeight, x, y)
    local inst = {}

    inst.gameWidth = gameWidth
    inst.gameHeight = gameHeight
    inst.x = x
    inst.y = y

    inst.inContext = inContext
    inst.update = update

    return inst
end

return View
