local menu = {}

local ySpacing = 14
local selectedColour = { 255, 0, 255 }
local regularColour = { 255, 255, 255 }

local selectSfx = love.audio.newSource("assets/sounds/menu_select.wav", "static")
local confirmSfx = love.audio.newSource("assets/sounds/menu_confirm.wav", "static")
selectSfx:setVolume(0.6)
confirmSfx:setVolume(0.6)

local _drawOption = function(x, y, option, index)
    love.graphics.print(option, x, y + (index - 1) * ySpacing)
end

local _drawSelectedOption = function(x, y, option, index)
    love.graphics.setColor(selectedColour)
    _drawOption(x, y, option, index)
    love.graphics.setColor(regularColour)
end

local next = function(self)
    selectSfx:play()
    self.selected = self.selected + 1
    if self.selected > #self.options then
        self.selected = 1
    end
end

local previous = function(self)
    selectSfx:play()
    self.selected = self.selected - 1
    if self.selected < 1 then
        self.selected = #self.options
    end
end

local confirm = function(self)
    confirmSfx:play()
    local currentOption = self.options[self.selected]
    currentOption["onSelect"]()
end

local draw = function(self, view)
    view:inDisplayContext(function()
        for i, option in ipairs(self.options) do
            if (i == self.selected) then
                _drawSelectedOption(self.x, self.y, option["text"], i)
            else
                _drawOption(self.x, self.y, option["text"], i)
            end
        end
    end)
end

menu.createOption = function(text, onSelect)
    return {
        text = text,
        onSelect = onSelect
    }
end

menu.create = function(x, y, options)
    local inst = {}

    inst.options = options
    inst.x = x
    inst.y = y

    inst.selected = 1

    inst.next = next
    inst.previous = previous
    inst.draw = draw
    inst.confirm = confirm

    return inst
end

return menu
