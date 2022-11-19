require("level")
require("util")

scene = 1

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
  if scene == 1 then
    updateLevel(dt)
  end
end
    
function love.draw()
  if scene == 1 then
    drawLevel()
  else
    drawWin()
  end
end

function drawWin()
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill",0,0,640,640)
  love.graphics.setColor(1,1,1)
  love.graphics.printf("You win!",font,0,290,640,"center")
end

function love.keypressed(key)
  if key == "space" then
    printInstanceCount()
    changeLevel()
  end
end