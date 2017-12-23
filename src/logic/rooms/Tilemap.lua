local tilemap = {}

local getTile = function(self, x, y, tileSize)
    local i = (math.floor(x / tileSize) + math.floor((y / tileSize)) * self.tilesWide) + 1

    self.lastGotTile = i

    return self.floorPlan:sub(i,i)
end

local draw = function(self, view, tilesheet)
    if self.background then
        view:inBackgroundContext(function()
            love.graphics.draw(self.background, 0, 0)
        end)
    end

    for i = 1, #self.floorPlan do
        local char = self.floorPlan:sub(i,i)
        local x = (i - 1) % self.tilesWide * tilesheet.tileSize
        local y = math.floor((i - 1) / self.tilesWide) * tilesheet.tileSize

        if char == "x" then tilesheet:drawTile(view, x, y, 2, 1) end
        if char == "X" then tilesheet:drawTile(view, x, y, 3, 2) end
        if char == "^" then tilesheet:drawTile(view, x, y, 4, 1) end
        if char == "v" then tilesheet:drawTile(view, x, y, 1, 3) end
        if char == "=" then tilesheet:drawTile(view, x, y, 3, 1) end
        if char == "." then tilesheet:drawTile(view, x, y, 1, 2) end
        if char == "," then tilesheet:drawTile(view, x, y, 2, 2) end
        if char == "s" then tilesheet:drawTile(view, x, y, 4, 2) end
        if char == "~" then tilesheet:drawTile(view, x, y, 2, 3) end

        if DEBUG and i == self.lastGotTile then
            view:inContext(function()
                love.graphics.rectangle("line", x, y, tilesheet.tileSize, tilesheet.tileSize)
            end)
        end
    end
end

tilemap.create = function(floorPlan, tilesWide, background, playerStartLeft, playerStartRight)
    local inst = {}

    inst.background = background
    inst.tilesWide = tilesWide
    -- inst.tilesHigh = 22
    inst.lastGotTile = 0
    inst.playerStartLeft = playerStartLeft
    inst.playerStartRight = playerStartRight

    local whitespace = "%s"
    local nothing = ""
    inst.floorPlan = floorPlan:gsub(whitespace, nothing)

    inst.getTile = getTile
    inst.draw = draw

    return inst
end

return tilemap
