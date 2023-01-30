local timer = 0

function updateTextTimer(dt)
  if currentLevel ~= -1 and currentLevel ~= 0 and currentLevel ~= NUMLEVELS+1 then
    timer = timer + dt
  end
  
  if timer > 1.5 then
    endText()
  end
end

function endText()
  timer = 0
  if currentLevel == -1 or currentLevel == 0 then
    currentLevel = currentLevel + 1
  elseif currentLevel == NUMLEVELS + 1 then
    currentLevel = -1
  elseif scene == 1 or scene == 4 then
    loadLevel(currentLevel)
    scene = 2      
  else
    currentLevel = currentLevel + 1
    scene = 1
  end
end

function drawText()
  local todraw, todrawFont, todraw_x,todraw_y,levelID
  todrawFont = fontSmall
  levelID = currentLevel
  if scene == 4 then
    todraw = "Try again!"
  elseif scene == 3 then
    todraw = "You got all the gems!"
  elseif currentLevel == -1 then
    todraw = "JELLYFISH ARCHIPELAGO"
    todrawFont = fontBig  
    levelID = NUMLEVELS + 1
  elseif currentLevel == 0 then
    todraw = "Help Treasure Hunter Lilli find all the gems!\n\nWatch out for the jellyfish!"
    todrawFont = fontSmall
    levelID = NUMLEVELS + 1
  elseif currentLevel == NUMLEVELS+1 then
    todraw = "You win!"
    todrawFont = fontBig
  else
    todraw = "Level " .. tostring(currentLevel) .. " of " .. tostring(NUMLEVELS)
    todrawFont = fontSmall
  end
  
  drawTiles(levelID)  
  love.graphics.setColor(0,0,0)
  love.graphics.printf(todraw,todrawFont,80+3,120+3,480,"center")
  love.graphics.setColor(1,1,1)
  love.graphics.printf(todraw,todrawFont,80,120,480,"center")
  love.graphics.setColor(1,1,1)
end