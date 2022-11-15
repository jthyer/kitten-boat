local MAPDATA = require("mapData")

function getCollide(x,y)
  local id_x = math.floor((x-16) / 32)
  local id_y = math.floor((y-16) / 32)

  if MAPDATA[id_y][id_x] == 1 or MAPDATA[id_y][id_x+1] or
     MAPDATA[id_y+1][id_x] == 1 or MAPDATA[id_y+1][id_x+1] then
       print("collide!")
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