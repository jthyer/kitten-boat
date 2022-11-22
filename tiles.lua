local quads = {}
local bg_tileset
local frame, frameCount = 0, 1

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

function updateTiles(dt)
  frame = frame + dt
  frameCount = -1
  if frame < 0.2 then
    frameCount = 1
  elseif frame > 0.4 then
    frameCount = 1
    frame = 0
  end    
end

function drawTiles(level)
  love.graphics.setColor(1,1,1)
  for i,v in ipairs(LEVELDATA[level].tiles) do
    for j,v2 in ipairs(v) do
      love.graphics.draw(bg_tileset, quads[1], (j-1) * 32 + 16,(i-1) * 32 + 16,
        0,frameCount,1,16,16)
      if v2 ~= 0 then
        love.graphics.draw(bg_tileset, quads[v2+1], (j-1) * 32,(i-1) * 32)
      end
    end
  end
end