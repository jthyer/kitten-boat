function drawTiles(level)
  for i,v in ipairs(LEVELDATA[level].tiles) do
    for j,v2 in ipairs(v) do
      if v2 == 0 then
        love.graphics.setColor(.5,.5,1)
      else
        love.graphics.setColor(.82,.77,.62)
      end
      love.graphics.rectangle("fill",(j-1)*32,(i-1)*32,32,32)
    end
  end
end