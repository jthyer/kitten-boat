local walls = {}

function tilesToWalls(level)
  walls = {}
  for i,v in ipairs(LEVELDATA[level].tiles) do
    for j,v2 in ipairs(v) do
      if v2 == 1 or v2 == 2 or v2 == 3 or v2 == 4 or v2 == 18 then
        local wall = {}
        wall.x = (j-1)*32
        wall.y = (i-1)*32
        wall.mask = 0
        table.insert(walls,wall)
      end
    
    end
  end
end

function loadWalls(level)
  tilesToWalls(level)
end

function checkCollisionSolid(x,y,top_offset)
  return checkCollision(x,y,walls,0,top_offset)
end