local boat = {}
  boat.x = 50
  boat.y = 50
  boat.hspeed = 0
  boat.vspeed = 0
  boat.windDir = 1

local BOATACCEL = 2
local BOATDEACCEL = 0.4
local MAXSPEED = 8
local WINDACCEL = 1

function updateBoat(dt)
  moveBoat(dt)
  wrapBoat()  
end

function moveBoat(dt)
  -- read keyboard input
  if love.keyboard.isDown("left") then
    boat.hspeed = boat.hspeed - (BOATACCEL * dt)     
  elseif love.keyboard.isDown("right") then
    boat.hspeed = boat.hspeed + (BOATACCEL * dt)     
  end

  if love.keyboard.isDown("up") then 
    boat.vspeed = boat.vspeed - (BOATACCEL * dt) 
  elseif love.keyboard.isDown("down") then
    boat.vspeed = boat.vspeed + (BOATACCEL * dt) 
  end
  
  boat.hspeed = boat.hspeed - (WINDACCEL * boat.windDir * dt)
    
  -- cap boat speed
  if boat.hspeed > MAXSPEED then 
    boat.hspeed = MAXSPEED 
  elseif boat.hspeed < -MAXSPEED then
    boat.hspeed = -MAXSPEED 
  end
  
  if boat.vspeed > MAXSPEED then 
    boat.vspeed = MAXSPEED 
  elseif boat.vspeed < -MAXSPEED then
    boat.vspeed = -MAXSPEED 
  end
  
  -- update x and y
  boat.x = boat.x + boat.hspeed
  boat.y = boat.y + boat.vspeed
  
  -- deaccelerate boat
  if boat.hspeed > 0 then
    boat.hspeed = boat.hspeed - (BOATDEACCEL * dt)
  elseif boat.hspeed < 0 then
    boat.hspeed = boat.hspeed + (BOATDEACCEL * dt)
  end
  
  if boat.vspeed > 0 then
    boat.vspeed = boat.vspeed - (BOATDEACCEL * dt)
  elseif boat.hspeed < 0 then
    boat.vspeed = boat.vspeed + (BOATDEACCEL * dt)
  end
  
  -- which squares is it touching
  local x1 = math.floor((boat.x + 16) / 32)
  local x2 = x1 + 1
  local y1 = math.floor((boat.y + 16) / 32)
  local y2 = y1 + 1
  
  --local 
  collide =
    getCollide(x1,y1) or getCollide(x1,y2) or
    getCollide(x2,y1) or getCollide(x2,y2)
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