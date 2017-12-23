local Tilemap = require("src.logic.rooms.Tilemap")

local background = love.graphics.newImage("assets/backgrounds/test_background.png")
background:setFilter("nearest", "nearest")

local bridgeFloorPlan = [[
    ##################################################
    ##################################################
    ##################################################
    ##################################################
    ##################################################
    ##################################################
    ##################################################
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ..................................................
    ..................................................
    ..................................................
    ...............................................,..
    ..............,...................................
    ..................................................
    ........................,.........................
    ..................................................
    vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
]]

return Tilemap.create(bridgeFloorPlan, background)
