local timer = 0

function loadEnemies()
  for i,v in ipairs(enemies) do
    v.hspeed = 0
    v.vspeed = 0
    if v.id == "redJellyfishH" then
      v.hspeed = 250
    elseif v.id == "redJellyfishV" then
      v.vspeed = 250
    end
  end
end

function loadBullet(x,y,target_x,target_y)
  local b = {}
  b.id = "bullet"
  b.x = x
  b.y = y
  
  local angle = math.atan2((target_y - b.y), (target_x - b.x))
		
  b.hspeed = 250 * math.cos(angle)
  b.vspeed = 250 * math.sin(angle)
  
  table.insert(enemies,b)
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
        loadBullet(v.x,v.y,boat.x,boat.y)
      end
    end
  end
  if timer > 1 then
    timer = 0
  end
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