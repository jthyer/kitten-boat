require("level")
require("text")
require("util")

scene = 1
currentLevel = -1

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Jellyfish Archipelago")
  fontSmall = love.graphics.newFont("BetterComicSans.ttf",56,"mono")
  fontBig = love.graphics.newFont("BetterComicSansBold.ttf",64,"mono")
  loadTiles()  
end
 

function love.update(dt)
  local validated_dt = dt
  if validated_dt > 0.05 then
    validated_dt = 0.05
  end
  if scene == 1 or scene == 3 or scene == 4 then
    updateTextTimer(dt)
  end
  if scene == 2 then
    updateLevel(dt)
  end
end
    
function love.draw()
  if scene == 2 then
    drawLevel()
  else
    drawText()
  end
end

function love.keypressed(key)
  if key == "space" then
    if scene == 1 or scene == 3 or scene == 4 then
      endText()
    elseif scene == 2 then
      scene = 3
    end
  end
end