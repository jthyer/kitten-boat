function loadSounds()
  sndBump = love.audio.newSource("sounds/bump.ogg", "static")
  sndBump:setVolume(0.5) 
  sndDeath1 = love.audio.newSource("sounds/death1.ogg", "static")
  sndDeath2 = love.audio.newSource("sounds/death2.ogg", "static")
  sndDeath3 = love.audio.newSource("sounds/death3.ogg", "static")
  sndGetReady = love.audio.newSource("sounds/getready.ogg", "static")
  sndPew = love.audio.newSource("sounds/pew.ogg", "static")
  sndYouWon = love.audio.newSource("sounds/youwon.ogg", "static")
  sndGem = love.audio.newSource("sounds/gem.ogg", "static")
  sndZap = love.audio.newSource("sounds/zap.ogg", "static")
  sndNiceWork = love.audio.newSource("sounds/nicework.ogg", "static")

  
  song = love.audio.newSource("music/BeachBBQWithVeryGoodFriends.ogg", "stream")
  song:setLooping(true)
  song:setVolume(0.4) 
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