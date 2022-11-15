require("boat")
require("wall")
require("enemy")
require("tiles")
require("util")

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Kitten Boat")
  font = love.graphics.newFont(32)
  
  loadWalls()
  loadEnemies()
end


function love.update(dt)
  updateBoat(dt)
end
    
  
function love.draw()
  drawTiles()
  --drawWalls()
  drawEnemies()
  drawBoat()
end