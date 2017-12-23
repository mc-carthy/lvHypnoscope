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

return Tilemap.create(dungeonRoomFloorPlan)
