local tilemap = {}

local draw = function(self, view, tilesheet)
    for i = 1, #self.map do
        local char = self.map:sub(i,i)
        local x = (i - 1) % self.tilesWide * tilesheet.tileSize
        local y = math.floor((i - 1) / self.tilesWide) * tilesheet.tileSize

        if char == "x" then tilesheet:drawTile(view, x, y, 1, 1) end
        if char == "." then tilesheet:drawTile(view, x, y, 2, 1) end
    end
end

tilemap.create = function()
    local inst = {}

    inst.tilesWide = 50
    inst.tilesHigh = 22

    local map = [[
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        x................................................x
        xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ]]

    local whitespace = "%s"
    local nothing = ""
    inst.map = map:gsub(whitespace, nothing)

    inst.draw = draw

    return inst
end

return tilemap
