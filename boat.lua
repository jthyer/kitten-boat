local BOATSPEED = 180
local WINDSPEED = 1

function loadBoat()
  spr_boat = love.graphics.newImage("sprites/spr_boat.png")  

  boatTable = {}
  boat = {}
    boat.x = 304
    boat.y = 512
    boat.hspeed = 0
    boat.vspeed = 0
    boat.windDir = 0  
    boat.mask = 24
    boat.dir = 1
  table.insert(boatTable,boat)
end

function updateBoat(dt)
  moveBoat(dt)
  if checkCollisionEnemies(boat.x,boat.y,8) then
    restartLevel()
  end
end

function moveBoat(dt)
  -- read keyboard input
  if love.keyboard.isDown("left") then
    boat.hspeed = -BOATSPEED * dt    
  elseif love.keyboard.isDown("right") then
    boat.hspeed = BOATSPEED * dt   
  else
    boat.hspeed = 0
  end

  if love.keyboard.isDown("up") then 
    boat.vspeed = -BOATSPEED * dt 
  elseif love.keyboard.isDown("down") then
    boat.vspeed = BOATSPEED * dt
  else
    boat.vspeed = 0
  end
  
  -- set speed
  if boat.hspeed ~= 0 and boat.vspeed ~= 0 then
    boat.hspeed = boat.hspeed * .71
    boat.vspeed = boat.vspeed * .71
  end
  
  boat.hspeed = boat.hspeed - (WINDSPEED * boat.windDir * dt)
  
  -- check for collision, update x and y
  local new_x = boat.x + boat.hspeed
  local new_y = boat.y + boat.vspeed
  local old_x = boat.x
  local old_y = boat.y
  
  if new_x < -8 then new_x = -8
  elseif new_x > 608+8 then new_x = 608+8 end
  if new_y < -16 then new_y = -16
  elseif new_y > 608+8 then new_y = 608+8 end

  local collide_x = checkCollisionSolid(new_x,boat.y,16)
  local collide_y = checkCollisionSolid(boat.x,new_y,16)

  if not collide_x then
    boat.x = new_x
  else
    boat.x = round(boat.x/16) * 16
  end
  if not collide_y then
    boat.y = new_y
  else
    boat.y = round(boat.y/16) * 16 
  end
  
  -- extra check to keep boat from going into corners
  if checkCollisionSolid(boat.x,boat.y,16) then
    boat.x = old_x
    boat.y = old_y
  end
  
  if boat.hspeed > 0 then
    boat.dir = 1
  elseif boat.hspeed < 0 then
    boat.dir = -1
  end
end

function drawBoat()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(spr_boat,boat.x+16,boat.y+16,0,boat.dir,1,16,16)
end