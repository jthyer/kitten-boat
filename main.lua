require("boat")
require("wall")
require("enemy")
require("tiles")
require("util")

levelData = require("levelData")
TILEDATA = levelData.tiles
enemies = levelData.enemies

for key,v in pairs(enemies) do
  print(v.id)
  print(v.x..","..v.y)
end

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Kitten Boat")
  font = love.graphics.newFont(32)
  
  loadWalls()
  loadEnemies()
end


function love.update(dt)
  local validated_dt = dt
  if validated_dt > 0.05 then
    validated_dt = 0.05
  end
  updateBoat(validated_dt)
  updateEnemies(validated_dt)
end
    
  
function love.draw()
  drawTiles()
  --drawWalls()
  drawEnemies()
  drawBoat()
end