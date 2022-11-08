local boat = {}
  boat.x = 50
  boat.y = 50
  boat.hspeed = 0
  boat.vspeed = 0
  boat.sail = true
  boat.sailPressed = false

local BOATACCEL = 2
local BOATDEACCEL = 0.4
local MAXSPEED = 3

function updateBoat(dt)
  moveBoat(dt)
  wrapBoat()  
  checkSail()
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
end

function wrapBoat()
 -- wrap screen
  if boat.x < -20 then 
    boat.x = 620 
  elseif boat.x > 620 then 
    boat.x = -20
  end
  
  if boat.y < -20 then
    boat.y = 620
  elseif boat.y > 620 then
    boat.y = -20
  end  
end

function checkSail()
  if love.keyboard.isDown("z") then
    if not boat.sailPressed then
      boat.sail = not boat.sail
      boat.sailPressed = true
    end
  else
    boat.sailPressed = false
  end
end

function drawBoat()
  love.graphics.setColor(1,1,1)
  love.graphics.circle("fill",boat.x,boat.y,20)
  if boat.sail then
    love.graphics.rectangle("fill",boat.x-5,boat.y-25,10,20)
  end
end