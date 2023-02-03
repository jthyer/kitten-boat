EXPORTTYPE = 1 -- 1 for web, 2 for desktop

require("level")
require("text")
require("util")
require("sound")

scene = 1
currentLevel = -1
screenMode = 1

function love.load()
  -- window settings
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  love.window.setTitle("Jellyfish Archipelago")
  fontSmall = love.graphics.newFont("BetterComicSans.ttf",56,"mono")
  fontBig = love.graphics.newFont("BetterComicSansBold.ttf",64,"mono")
  loadTiles()  
  
  -- get desktop settings
  local d_width,d_height = love.window.getDesktopDimensions(select(3,love.window.getMode()).display)
  
  if d_width >= d_height then
    fullscreenScale = d_height / 640 
  else
    fullscreenScale = d_width / 640
  end
  fullscreenXOffset = (d_width - 640) / 2
  fullscreenYOffset = (d_height - 640) / 2
  fullscreenScaledXOffset = (d_width - (fullscreenScale * 640)) / 2
  fullscreenScaledYOffset = (d_height - (fullscreenScale * 640)) / 2
  
  -- set audio
  loadSounds()
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
  love.graphics.push()
  if EXPORTTYPE == 2 then
    if screenMode == 2 then
      love.graphics.translate(fullscreenXOffset, fullscreenYOffset)
    elseif screenMode == 3 then
      love.graphics.translate(fullscreenScaledXOffset, fullscreenScaledYOffset)
      love.graphics.scale(fullscreenScale, fullscreenScale) 
    end
  end
  
  if scene == 2 then
    drawLevel()
  else
    drawText()
  end
  love.graphics.pop()
end

function love.keypressed(key)
  if key == "r" then
    restartGame()
    return
  end
  
  if EXPORTTYPE == 2 and key == "escape" then
    love.event.quit()
  end
  
  if EXPORTTYPE == 2 and key == "f" then
    if screenMode == 1 then
      love.window.setFullscreen(true, "desktop")
      screenMode = 2
    elseif screenMode == 2 then
      screenMode = 3
    else
      love.window.setFullscreen(false, "desktop")
      screenMode = 1
    end
  end
  
  if scene ~= 2 then
    if key == "space" or key == "pagedown" or key == "pageup" then
      endText()
    end
  elseif key == "pagedown" and currentLevel < NUMLEVELS + 1 then
    scene = 3
  elseif key == "pageup" then
    if currentLevel > 1 then
      currentLevel = currentLevel - 1
      scene = 1
    else
      restartGame()
    end
  end
end