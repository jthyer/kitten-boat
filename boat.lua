local boat = {}
  boat.x = 50
  boat.y = 50
  boat.hspeed = 0
  boat.vspeed = 0
  boat.windDir = 0

local BOATSPEED = 150
local WINDSPEED = 1

local dead = false

function updateBoat(dt)
  moveBoat(dt)
  dead = checkCollisionEnemies(boat.x,boat.y)
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
  
  if boat.hspeed ~= 0 and boat.vspeed ~= 0 then
    boat.hspeed = boat.hspeed * .71
    boat.vspeed = boat.vspeed * .71
  end
  
  boat.hspeed = boat.hspeed - (WINDSPEED * boat.windDir * dt)
  
  -- update x and y
  local new_x = boat.x + boat.hspeed
  local new_y = boat.y + boat.vspeed
  
  if new_x < 0 then new_x = 0
  elseif new_x > 640 then new_x = 640 end
  if new_y < 0 then new_y = 0 
  elseif new_y > 640 then new_y = 640 end
   
  local collide_x = checkCollisionSolid(new_x,boat.y)
  local collide_y = checkCollisionSolid(boat.x,new_y)

  if not collide_x then
    boat.x = new_x
  else
    boat.x = round(boat.x/32) * 32
  end
  if not collide_y then
    boat.y = new_y
  else
    boat.y = round(boat.y/32) * 32 
  end
end

function drawBoat()
  love.graphics.setColor(1,1,0)
  love.graphics.circle("fill",boat.x+16,boat.y+16,16)

  if dead then
    love.graphics.setColor(1,0,0)
    love.graphics.printf("DEAD",font,0,100,640,"center")
  end
end