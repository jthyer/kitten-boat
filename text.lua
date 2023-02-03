local timer = 0

function updateTextTimer(dt)
  if currentLevel ~= -1  then
    timer = timer + dt
  end
  
  if (timer > 1.5 and currentLevel ~= 0 and currentLevel ~= NUMLEVELS+1) or
     (timer > 4 and currentLevel == 0) or
     (timer > 6 and currentLevel == NUMLEVELS+1) then
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
  if scene == 1 and currentLevel > 0 and currentLevel <= NUMLEVELS then
    sndGetReady:play()
  end
  if scene == 1 and currentLevel == NUMLEVELS + 1 then
    sndYouWon:play()
  end
end

function drawText()
  local todraw, todrawFont, todraw_x,todraw_y,levelID,y_offset
  todrawFont = fontSmall
  levelID = currentLevel
  y_offset = 165
  
  if scene == 4 then
    todraw = "Try again!"
  elseif scene == 3 then
    todraw = "You got all the gems!"
  elseif currentLevel == -1 then
    todraw = "JELLYFISH ARCHIPELAGO"
    todrawFont = fontBig  
    y_offset = 51
    levelID = NUMLEVELS+1
  elseif currentLevel == 0 then
    todraw = "Help Treasure Hunter Lilly find all the gems!\n\nWatch out for the jellyfish!"
    todrawFont = fontSmall
    y_offset = -7
    levelID = NUMLEVELS+1
  elseif currentLevel == NUMLEVELS+1 then
    y_offset = -20
    todraw = "You win!"
    todrawFont = fontBig
  else
    todraw = "Stage " .. tostring(currentLevel) .. " of " .. tostring(NUMLEVELS-1)
    todrawFont = fontSmall
  end
  
  drawTiles(levelID)  
  love.graphics.setColor(0,0,0)
  love.graphics.printf(todraw,todrawFont,80+3,120+3+y_offset,480,"center")
  love.graphics.setColor(1,1,1)
  love.graphics.printf(todraw,todrawFont,80,120+y_offset,480,"center")
  if (currentLevel == -1) then
    love.graphics.setColor(0,0,0)
    love.graphics.printf("Press Space to Start!",fontSmall,40+3,400+3,560,"center")
    love.graphics.setColor(1,1,1)
    love.graphics.printf("Press Space to Start!",fontSmall,40,400,560,"center")
  elseif (currentLevel == NUMLEVELS+1) then
    love.graphics.setColor(0,0,0)
    love.graphics.printf("A game by John Thyer",fontSmall,40+3,240+3,560,"center")
    love.graphics.printf("Made for Sylvie's Jam #1",fontSmall,20+3,240+110+3,600,"center")
    love.graphics.printf("Thanks for playing!",fontSmall,40+3,240+220+3,560,"center")
    love.graphics.setColor(1,1,1)
    love.graphics.printf("A game by John Thyer",fontSmall,40,240,560,"center")
    love.graphics.printf("Made for Sylvie's Jam #1",fontSmall,20,240+110,600,"center")
    love.graphics.printf("Thanks for playing!",fontSmall,40,240+220,560,"center")
  end
end

function restartGame()
  timer = 0
  currentLevel = -1
  scene = 1
end