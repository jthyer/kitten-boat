local MAPDATA = require("mapData")

function getCollide(x,y)
  local y2 = y
  
  if y < 1 then y2 = 1 
  elseif y > 20 then y2 = 20 end

  if MAPDATA[y2][x] == 1 then
    return true
  else
    return false
  end
end

function drawMap()
  for i,v in ipairs(MAPDATA) do
    for j,v2 in ipairs(v) do
      if v2 == 0 then
        love.graphics.setColor(.5,.5,1)
      else
        love.graphics.setColor(.82,.77,.62)
      end
      love.graphics.rectangle("fill",(j-1)*32,(i-1)*32,32,32)
    end
  end
end