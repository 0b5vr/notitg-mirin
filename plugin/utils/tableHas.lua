local tableIndexOf = require( 'utils/tableIndexOf' )

-- javascript set.has
local tableHas = function( t, element )
  return tableIndexOf( t, element ) ~= 0
end

return tableHas
