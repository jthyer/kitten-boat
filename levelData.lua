local NUMLEVELS = 2
local json = require("json")
local levelData = {}

for level = 1,NUMLEVELS do
  table.insert(levelData,{})
  levelData[level].tiles = {}
  levelData[level].enemies = {}

  local raw = love.filesystem.read("levels/level"..tostring(level)..".json")
  local jsonData = json.decode(raw)
    
  for i = 1, 20 do
    local row = {}
    for i2 = 1, 20 do
      table.insert(row,jsonData["layers"][2]["data"][i2+((i-1)*20)])
    end
    table.insert(levelData[level].tiles,row)
  end
  
  for key,v in pairs(jsonData["layers"][1]["entities"]) do
    local enemy = {}
      enemy.id = v["name"]
      enemy.x = v["x"]
      enemy.y = v["y"]
    table.insert(levelData[level].enemies,enemy)
  end
end

return levelData