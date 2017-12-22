local animation = {}

local update = function(self, game)
    self.currentFrameDisplayTime = self.currentFrameDisplayTime + game.dt
    if self.currentFrameDisplayTime > self.maxFrameDisplayTyime then
        self.currentFrameDisplayTime = 0
        self.frameIndex = self.frameIndex + 1
        if self.frameIndex > #self.frames then self.frameIndex = 1 end
    end
end

local frame = function(self)
    return self.frames[self.frameIndex]
end

animation.create = function(frames, updatesPerFrame)
    local inst = {}

    inst.frames = frames
    inst.maxFrameDisplayTyime = updatesPerFrame * (1 / 60)
    inst.currentFrameDisplayTime = 0
    inst.frameIndex = 1

    inst.update = update
    inst.frame = frame

    return inst
end

animation.WALK = animation.create({1, 2}, 15)
animation.STAND = animation.create({1}, 15)

return animation
