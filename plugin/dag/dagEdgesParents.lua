local tableFilter = require( 'utils/tableFilter' )
local tableMap = require( 'utils/tableMap' )

-- Return all parent sources the specified destination has.
--
-- @param edges An array of dag edge
-- @param destination The target destination
local dagEdgesParents = function( edges, destination )
  local destinationEdges = tableFilter( edges, function( edge )
    return edge[ 2 ] == destination
  end )

  return tableMap( destinationEdges, function( edge )
    return edge[ 1 ]
  end )
end

-- local edges = {
--   { 'a', 'b' },
--   { 'b', 'c' },
--   { 'a', 'd' },
--   { 'a', 'e' },
--   { 'b', 'e' },
--   { 'c', 'e' },
--   { 'b', 'f' },
--   { 'e', 'f' },
-- };

-- local subject = dagEdgesParents( edges, 'f' )
-- print( table.concat( subject, ', ' ) ) -- 'b, e'

return dagEdgesParents
