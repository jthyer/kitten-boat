require("boat")

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Kitten Boat")
end


function love.update(dt)
  updateBoat(dt)
end
    
  
function love.draw()
  love.graphics.setColor(.5,.5,1)
  love.graphics.rectangle("fill",0,0,600,600)
  drawBoat()
end