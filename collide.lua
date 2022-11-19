function checkCollision(x, y, table, mask)
  local collide = false
  
  local a_left = x + mask
  local a_right = x + 32 - mask
  local a_top = y + mask
  local a_bottom = y + 32 - mask
  
  for i,v in ipairs(table) do
    local b_left = v.x + v.mask
    local b_right = v.x + 32 - v.mask
    local b_top = v.y + v.mask
    local b_bottom = v.y + 32 - v.mask
    
    if a_right > b_left and a_left < b_right and 
      a_bottom > b_top and a_top < b_bottom then
      collide = true
    end
  end    
  
  return collide
end