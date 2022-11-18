require("level")
require("util")

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Kitten Boat")
  font = love.graphics.newFont(32)

  loadLevel(1)
end


function love.update(dt)
  local validated_dt = dt
  if validated_dt > 0.05 then
    validated_dt = 0.05
  end
  updateLevel(dt)
end
    
function love.draw()
  drawLevel()
end

function love.keypressed(key)
  if key == "space" then
    printInstanceCount()
    changeLevel()
  end
end