local quads = {}
local bg_tileset

function loadTiles()
  bg_tileset = love.graphics.newImage("tileset/tileset.png")
  
  local image_width = bg_tileset:getWidth()
  local image_height = bg_tileset:getHeight()
  
  local rows = image_width / 32
  local cols = image_height / 32
  
  for i = 0, cols-1 do
    for j = 0, rows-1 do
      table.insert(quads,love.graphics.newQuad(
          j * 32, i * 32, 32, 32, image_width,image_height))
    end
  end  
end

function drawTiles(level)
  for i,v in ipairs(LEVELDATA[level].tiles) do
    for j,v2 in ipairs(v) do
     -- print(j..","..i..": "..v2+1)
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle("fill",(j-1)*32,(i-1)*32,32,32)
      love.graphics.draw(bg_tileset, quads[v2+1], (j-1) * 32,(i-1) * 32)
    end
  end
end