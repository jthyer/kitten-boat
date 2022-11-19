local gems = {}

function loadGems(level)
  gems = deepcopy(LEVELDATA[level].gems)
end

function updateGems()
  for i,v in ipairs(gems) do
    if checkCollision(v.x,v.y,boatTable,-16) then
      table.remove(gems,i)
    end
  end
  
  return #gems
end

function drawGems()
  love.graphics.setColor(1,1,1)
  for i,v in ipairs(gems) do
    love.graphics.rectangle("fill",v.x+4,v.y+4,24,24)
  end
end