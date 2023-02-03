function loadSounds()
  local effectVolume = 2
  local musicVolume = 3
  
  sndBump = love.audio.newSource("sounds/bump.ogg", "static")
  sndBump:setVolume(0.03 * effectVolume)
  sndDeath1 = love.audio.newSource("sounds/death1.ogg", "static")
  sndDeath1:setVolume(0.15 * effectVolume)
  sndDeath2 = love.audio.newSource("sounds/death2.ogg", "static")
  sndDeath2:setVolume(0.15 * effectVolume)
  sndDeath3 = love.audio.newSource("sounds/death3.ogg", "static")
  sndDeath3:setVolume(0.1 * effectVolume)
  sndGetReady = love.audio.newSource("sounds/getready.ogg", "static")
  sndGetReady:setVolume(0.1 * effectVolume) 
  sndPew = love.audio.newSource("sounds/pew.ogg", "static")
  sndPew:setVolume(0.15 * effectVolume)  
  sndYouWon = love.audio.newSource("sounds/youwon.ogg", "static")
  sndYouWon:setVolume(0.1 * effectVolume) 
  sndGem = love.audio.newSource("sounds/gem.ogg", "static")
  sndGem:setVolume(0.1 * effectVolume)  
  sndZap = love.audio.newSource("sounds/zap.ogg", "static")
  sndZap:setVolume(0.15 * effectVolume)  
  sndNiceWork = love.audio.newSource("sounds/nicework.ogg", "static")
  sndNiceWork:setVolume(0.1 * effectVolume)  

  
  song = love.audio.newSource("music/BeachBBQWithVeryGoodFriends.ogg", "stream")
  song:setLooping(true)
  song:setVolume(0.03 * musicVolume)
  song:play()
end

function playSound(s)
  local clone = s:clone()
	clone:play()
end

function playDeathSound()
  local r = love.math.random( 1, 3 )
  if r == 1 then
    playSound(sndDeath1)
  elseif r == 2 then
    playSound(sndDeath2)
  elseif r == 3 then
    playSound(sndDeath3)
  end
end