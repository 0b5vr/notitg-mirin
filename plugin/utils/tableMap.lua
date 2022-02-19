-- javascript array.map
local tableMap = function( t, callback )
  local result = {}

  for _, v in ipairs( t ) do
    table.insert( result, callback( v ) or nil )
  end

  return result
end

return tableMap
