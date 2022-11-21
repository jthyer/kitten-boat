require("boat")
require("wall")
require("enemy")
require("gems")
require("tiles")
require("collide")

local currentLevel = 1
LEVELDATA = require("levelData")

function restartLevel(l)
  loadLevel(currentLevel)
end

function loadLevel(l)
  currentLevel = l
  loadWalls(currentLevel)
  loadEnemies(currentLevel)
  loadGems(currentLevel)
  loadBoat() 
end

function updateLevel(dt)
  if updateGems(dt) == 0 then
    if currentLevel == 2 then
      scene = 2
    else
      loadLevel(currentLevel + 1)
    end
  else
    updateBoat(dt)
    updateEnemies(dt)
  end
end

function drawLevel()
  drawTiles(currentLevel)
  drawGems()
  drawEnemies()
  drawBoat()
end

function changeLevel()
  local newLevel
  if currentLevel == 1 then
    newLevel = 2
  else
    newLevel = 1
  end
  loadLevel(newLevel)
end