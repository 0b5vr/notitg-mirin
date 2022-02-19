-- javascript array.find
-- Since lua can return two values, the first value will be the index and second will be the value.
-- If it can't find a value, it will return `0, nil` instead.
local tableFind = function( t, callback )
  for i, v in ipairs( t ) do
    if callback( v ) then
      return i, v
    end
  end

  return 0, nil
end

return tableFind
