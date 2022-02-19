-- javascript array.indexOf
local tableIndexOf = function( t, element )
  for i, v in ipairs( t ) do
    if v == element then
      return i
    end
  end

  return 0
end

return tableIndexOf
