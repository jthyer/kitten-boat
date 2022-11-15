require("boat")
require("map")
require("collide")

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Kitten Boat")
  font = love.graphics.newFont(32)
end


function love.update(dt)
  updateBoat(dt)
end
    
  
function love.draw()
  drawMap()
  drawBoat()
end