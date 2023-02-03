WINDOWWIDTH = 640
WINDOWHEIGHT = 640

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest", 1)
  
  -- get desktop settings
  local d_width,d_height = 
    love.window.getDesktopDimensions(select(3,love.window.getMode()).display)
  
  -- set fullscreen variables
  if d_width >= d_height then
    fullscreenScale = d_height / WINDOWHEIGHT
  else
    fullscreenScale = d_width / WINDOWWIDTH
  end
  fullscreenXOffset = (d_width - (fullscreenScale * WINDOWWIDTH)) / 2
  fullscreenYOffset = (d_height - (fullscreenScale * WINDOWHEIGHT)) / 2
end

function love.keypressed(key)
  if key == "f" then
    love.window.setFullscreen(not love.window.getFullscreen(), "desktop")
  end
end

function love.draw()
  love.graphics.push()
  if love.window.getFullscreen() then
    love.graphics.translate(fullscreenXOffset, fullscreenYOffset)
    love.graphics.scale(fullscreenScale, fullscreenScale) 
  end
  
  drawGame()
  
  love.graphics.pop()
end



