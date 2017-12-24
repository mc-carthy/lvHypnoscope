local menu = {}

local xPos = 18
local ySpacing = 14
local selectedColour = { 255, 0, 255 }
local regularColour = { 255, 255, 255 }

local _drawOption = function(option, index)
    love.graphics.print(option, xPos, index * ySpacing)
end

local _drawSelectedOption = function(option, index)
    love.graphics.setColor(selectedColour)
    _drawOption(option, index)
    love.graphics.setColor(regularColour)
end

local next = function(self)
    self.selected = self.selected + 1
    if self.selected > #self.options then
        self.selected = 1
    end
end

local previous = function(self)
    self.selected = self.selected - 1
    if self.selected < 1 then
        self.selected = #self.options
    end
end

local confirm = function(self)
    local currentOption = self.options[self.selected]
    currentOption["onSelect"]()
end

local draw = function(self, view)
    view:inDisplayContext(function()
        for i, option in ipairs(self.options) do
            if (i == self.selected) then
                _drawSelectedOption(option["text"], i)
            else
                _drawOption(option["text"], i)
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

menu.create = function(options)
    local inst = {}

    inst.options = options
    inst.selected = 1

    inst.next = next
    inst.previous = previous
    inst.draw = draw
    inst.confirm = confirm

    return inst
end

return menu
