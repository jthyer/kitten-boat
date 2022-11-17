json = require("json")

local levelData = {}
  levelData.tiles = {}
  levelData.enemies = {}
local raw = love.filesystem.read("levels/level1.json")
local jsonData = json.decode(raw)
  
for i = 1, 20 do
  local row = {}
  for i2 = 1, 20 do
    table.insert(row,jsonData["layers"][2]["data"][i2+((i-1)*20)])
  end
  table.insert(levelData.tiles,row)
end

for key,v in pairs(jsonData["layers"][1]["entities"]) do
  local enemy = {}
    enemy.id = v["name"]
    enemy.x = v["x"]
    enemy.y = v["y"]
  table.insert(levelData.enemies,enemy)
end

return levelData