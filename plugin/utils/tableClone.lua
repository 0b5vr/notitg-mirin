-- clone given array
local tableClone = function( t )
  local result = {}

  for _, v in ipairs( t ) do
    table.insert( result, v )
  end

  return result
end

return tableClone
