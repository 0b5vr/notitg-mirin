-- javascript array.filter
local tableFilter = function( t, callback )
  local result = {}

  for _, v in ipairs( t ) do
    if callback( v ) then
      table.insert( result, v )
    end
  end

  return result
end

return tableFilter
