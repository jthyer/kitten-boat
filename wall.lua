local walls = {}

-- temporary, will replace later
local TILEDATA = require("tileData") 
function tilesToWalls()
  for i,v in ipairs(TILEDATA) do
    for j,v2 in ipairs(v) do
      if v2 == 1 then
        local wall = {}
        wall.x = (j-1)*32
        wall.y = (i-1)*32
        table.insert(walls,wall)
      end
    end
  end
end
-- temporary, will replace later

function loadWalls()
  tilesToWalls()
  table.insert(walls,wall2)
end

function drawWalls()
  love.graphics.setColor(1,1,1)
  for i,v in ipairs(walls) do
    love.graphics.rectangle("fill",v.x,v.y,32,32)
  end
end

function checkCollisionSolid(x,y)
  return checkCollision(x,y,walls)
end