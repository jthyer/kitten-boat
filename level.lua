require("boat")
require("wall")
require("enemy")
require("tiles")

local currentLevel = 1
LEVELDATA = require("levelData")

function restartLevel(l)
  loadLevel(currentLevel)
end

function loadLevel(l)
  currentLevel = l
  loadWalls(currentLevel)
  loadEnemies(currentLevel)
  loadBoat() 
end

function updateLevel(dt)
  updateBoat(dt)
  updateEnemies(dt)
end

function drawLevel()
  drawTiles(currentLevel)
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