require("boat")
require("wall")
require("enemy")
require("gems")
require("tiles")
require("collide")

LEVELDATA = require("levelData")

function restartLevel(l)
  scene = 4
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
    scene = 3
  else
    updateTiles(dt)
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