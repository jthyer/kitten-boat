local BULLETINTERVAL = 1.5
local BULLETSPEED = 200

local timer = 0
local enemies = 0
local frame = 0
local frameCount

local enemySprites = { 
  ["stillJellyfish"] = love.graphics.newImage("sprites/spr_redJellyfish.png"),
  ["redJellyfishH"] = love.graphics.newImage("sprites/spr_redJellyfish.png"),
  ["redJellyfishV"] = love.graphics.newImage("sprites/spr_redJellyfish.png"),
  ["greenJellyfish"]= love.graphics.newImage("sprites/spr_greenJellyfish.png"),
  ["blueJellyfish"]= love.graphics.newImage("sprites/spr_blueJellyfish.png"),
  ["bullet"]= love.graphics.newImage("sprites/spr_bullet.png")
}


function loadEnemies(level)
  timer = 0
  enemies = deepcopy(LEVELDATA[level].enemies)
  for i,v in ipairs(enemies) do
    v.hspeed = 0
    v.vspeed = 0
    v.mask = 4
    if v.id == "redJellyfishH" then
      v.hspeed = 250
    elseif v.id == "redJellyfishV" then
      v.vspeed = 250
    end
    v.rotation = 0
  end
end

function loadBullet(x,y,target_x,target_y)
  local b = {}
  b.id = "bullet"
  b.x = x
  b.y = y
  b.mask = 16
  
  local angle = math.atan2((target_y - b.y), (target_x - b.x))
  
  b.rotation = angle + 1.571
    
  b.hspeed = BULLETSPEED * math.cos(angle)
  b.vspeed = BULLETSPEED * math.sin(angle)
 
  table.insert(enemies,b)
end

function updateEnemies(dt)
  timer = timer + dt
  frame = frame + dt
  frameCount = -1
  
  if frame < 0.5 then
    frameCount = 1
  elseif frame > 1 then 
    frameCount = 1
    frame = 0 
  end
  
  for i,v in ipairs(enemies) do
    if v.id == "redJellyfishH" then
      local new_x = v.x + (v.hspeed * dt)
      if checkCollisionSolid(new_x,v.y,0) then
        v.hspeed = v.hspeed * -1
      end
      v.x = v.x + (v.hspeed * dt)
    elseif v.id == "redJellyfishV" then
      local new_y = v.y + (v.vspeed * dt)
      if checkCollisionSolid(v.x,new_y,0) then
        v.vspeed = v.vspeed * -1
      end
      v.y = v.y + (v.vspeed * dt)
    elseif v.id == "bullet" then
      v.x = v.x + (v.hspeed * dt)
      v.y = v.y + (v.vspeed * dt)      
      if checkCollisionSolid(v.x,v.y,0) then
        table.remove(enemies,i)
      end
    elseif v.id == "blueJellyfish" then
      if timer > BULLETINTERVAL then
        loadBullet(v.x,v.y,boat.x,boat.y+8)
      end
    end
  end
  if timer > BULLETINTERVAL then
    timer = 0
  end
end

function drawEnemies()
  love.graphics.setColor(1,1,1)
  for i,v in ipairs(enemies) do
    love.graphics.draw(enemySprites[v.id],v.x+16,v.y+16,v.rotation,frameCount,1,16,16)
  end
end

function checkCollisionEnemies(x,y)
  return checkCollision(x,y,enemies,4,16)
end

function printInstanceCount()
  print(#enemies)
end