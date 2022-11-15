local boat = {}
  boat.x = 50
  boat.y = 50
  boat.hspeed = 0
  boat.vspeed = 0
  boat.windDir = 0

local BOATSPEED = 150
local WINDSPEED = 1

function updateBoat(dt)
  moveBoat(dt)
  wrapBoat()  
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
  
  local collide = getCollide(new_x,new_y)

  if not collide then
    boat.x = new_x
    boat.y = new_y
  end
end

function wrapBoat()
 -- wrap screen
  if boat.x < -16 then 
    boat.x = 660 
  elseif boat.x > 660 then 
    boat.x = -16
  end
  
  if boat.y < -16 then
    boat.y = 660
  elseif boat.y > 660 then
    boat.y = -16
  end  
end

function drawBoat()
  love.graphics.setColor(1,1,0)
  love.graphics.circle("fill",boat.x,boat.y,16)
  --love.graphics.rectangle("fill",boat.x-4,boat.y-20,10,20)
  
  if collide then
    love.graphics.setColor(1,0,0)
    love.graphics.printf("DEAD",font,0,304,640,"center")
  end
end