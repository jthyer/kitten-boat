local enemies = {}

function loadEnemies()
  local enemy = {}
    enemy.id = "redJellyfish"
    enemy.x = 256
    enemy.y = 320
  local enemy2 = {}
    enemy2.id = "redJellyfish"
    enemy2.x = 320
    enemy2.y = 224
  table.insert(enemies,enemy)   
  table.insert(enemies,enemy2) 
end

function updateEnemies()
  
end

function drawEnemies()
  love.graphics.setColor(1,.2,.2)
  for i,v in ipairs(enemies) do
    love.graphics.rectangle("fill",v.x,v.y,32,32)
  end
end

function checkCollisionEnemies(x,y)
  return checkCollision(x,y,enemies)
end