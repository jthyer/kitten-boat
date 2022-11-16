local enemies = {}
local timer = 0

function loadEnemies()
  local enemy = {}
    enemy.id = "redJellyfishH"
    enemy.x = 256
    enemy.y = 320
    enemy.hspeed = 250
    enemy.vspeed = 0
  local enemy2 = {}
    enemy2.id = "blueJellyfish"
    enemy2.x = 320
    enemy2.y = 224
    enemy2.hspeed = 0
    enemy2.vspeed = 0
  local enemy3 = {}
    enemy3.id = "redJellyfishV"
    enemy3.x = 128
    enemy3.y = 128
    enemy3.hspeed = 0
    enemy3.vspeed = 250
  local enemy4 = {}
    enemy4.id = "bullet"
    enemy4.x = 256
    enemy4.y = 256
    enemy4.hspeed = 250
    enemy4.vspeed = 250
  table.insert(enemies,enemy)   
  table.insert(enemies,enemy2) 
  table.insert(enemies,enemy3) 
  table.insert(enemies,enemy4) 
end

function updateEnemies(dt)
  timer = timer + dt
  for i,v in ipairs(enemies) do
    if v.id == "redJellyfishH" then
      local new_x = v.x + (v.hspeed * dt)
      if checkCollisionSolid(new_x,v.y) then
        v.hspeed = v.hspeed * -1
      end
      v.x = v.x + (v.hspeed * dt)
    elseif v.id == "redJellyfishV" then
      local new_y = v.y + (v.vspeed * dt)
      if checkCollisionSolid(v.x,new_y) then
        v.vspeed = v.vspeed * -1
      end
      v.y = v.y + (v.vspeed * dt)
    elseif v.id == "bullet" then
      v.x = v.x + (v.hspeed * dt)
      v.y = v.y + (v.vspeed * dt)      
      if checkCollisionSolid(v.x,v.y) then
        table.remove(enemies,i)
      end
    elseif v.id == "blueJellyfish" then
      if timer > 1 then
        local b = {}
          b.id = "bullet"
          b.x = v.x
          b.y = v.y
          b.hspeed = 250
          b.vspeed = 250    
        table.insert(enemies,b)
      end
    end
  end
  if timer > 1 then
    timer = 0
  end
  
  print(#enemies)
end

function drawEnemies()
  for i,v in ipairs(enemies) do
    if v.id == "redJellyfishH" or v.id == "redJellyfishV" then
      love.graphics.setColor(1,.2,.2)
    else
      love.graphics.setColor(.2,.2,1)
    end
    if v.id == "bullet" then
      love.graphics.rectangle("fill",v.x+8,v.y+8,16,16)      
    else
      love.graphics.rectangle("fill",v.x,v.y,32,32)
    end
  end
end

function checkCollisionEnemies(x,y)
  return checkCollision(x,y,enemies)
end