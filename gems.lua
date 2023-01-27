local gems = {}

local frame = 0
local frameCount = 1

local spr_gem = { 
  love.graphics.newImage("sprites/spr_gem.png") ,
  love.graphics.newImage("sprites/spr_gem.png")
  }

function loadGems(level)
  gems = deepcopy(LEVELDATA[level].gems)
end

function updateGems(dt)
  --frame = frame + dt
  frameCount = frameCount + 1
  if frameCount == 3 then
    frameCount = 1
  end
  
  for i,v in ipairs(gems) do
    if checkCollision(v.x,v.y,boatTable,-24,0) then
      table.remove(gems,i)
    end
  end
  
  return #gems
end

function drawGems()
  love.graphics.setColor(1,1,1)
  for i,v in ipairs(gems) do
    love.graphics.draw(spr_gem[2],v.x,v.y)
  end
end