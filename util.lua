-- http://lua-users.org/wiki/CopyTable
function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function round(n) 
  return math.floor(n+0.5) 
end

function loadSounds()
  sndBump = love.audio.newSource("sounds/bump.ogg", "static")
  sndBump:setVolume(0.03)
  sndDeath1 = love.audio.newSource("sounds/death1.ogg", "static")
  sndDeath1:setVolume(0.15)
  sndDeath2 = love.audio.newSource("sounds/death2.ogg", "static")
  sndDeath2:setVolume(0.15)
  sndDeath3 = love.audio.newSource("sounds/death3.ogg", "static")
  sndDeath3:setVolume(0.1)
  sndGetReady = love.audio.newSource("sounds/getready.ogg", "static")
  sndGetReady:setVolume(0.1) 
  sndPew = love.audio.newSource("sounds/pew.ogg", "static")
  sndPew:setVolume(0.15)  
  sndYouWon = love.audio.newSource("sounds/youwon.ogg", "static")
  sndYouWon:setVolume(0.1) 
  sndGem = love.audio.newSource("sounds/gem.ogg", "static")
  sndGem:setVolume(0.1)  
  sndZap = love.audio.newSource("sounds/zap.ogg", "static")
  sndZap:setVolume(0.15)  
  sndNiceWork = love.audio.newSource("sounds/nicework.ogg", "static")
  sndNiceWork:setVolume(0.1)  

  
  song = love.audio.newSource("music/BeachBBQWithVeryGoodFriends.ogg", "stream")
  song:setLooping(true)
  song:setVolume(0.03)
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