local Tilemap = require("src.logic.rooms.Tilemap")

local dungeonRoomFloorPlan = [[
    ^^^^^^^^^^^^^^^^^^^^^^^XXXX^^^^^^^^^^^^^^^^^^^^^^^
    xxxxxxxxxxxxxxxxxxxxxxxXXXXxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxXXXXxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxXXXXxxxxxxxxxxxxxxxxxxxxxxx
    =======================XXXXxxxxxxxxxxxxxxxxxxxxxxx
    .......................sXXXxxxxxxxxxxxxxxxxxxxxxxx
    ........................sXXxxxxxxxxxxxxxxxxxxxxxxx
    .........................sXxxxxxxxxxxxxxxxxxxxxxxx
    ..........................s=======================
    .............,....................................
    ..................................................
    ..................................................
    ..................................................
    ..................................................
    ........................,.........................
    ..................................................
    vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
]]

return Tilemap.create(dungeonRoomFloorPlan, 50, nil, { x = 5, y = 0, z = 90 }, { x = 380, y = 0, z = 90 })
