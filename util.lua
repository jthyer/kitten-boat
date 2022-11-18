function checkCollision(x, y, table, mask1, mask2)
  local COLLISIONMASK = 32
  local collide = false
  
  local a_left = x
  local a_right = x + COLLISIONMASK
  local a_top = y
  local a_bottom = y + COLLISIONMASK
  
  for i,v in ipairs(table) do
    local b_left = v.x
    local b_right = v.x + COLLISIONMASK
    local b_top = v.y
    local b_bottom = v.y + COLLISIONMASK
    
    if a_right > b_left and a_left < b_right and 
      a_bottom > b_top and a_top < b_bottom then
      collide = true
    end
  end    
  
  return collide
end

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
