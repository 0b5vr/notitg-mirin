local tableFind = require( 'utils/tableFind' )
local tableMap = require( 'utils/tableMap' )

-- Return first parent source the specified destination has.
-- If it can't find a parent, it will return `null` instead.
--
-- @param edges An array of dag edge
-- @param destination The target destination
local dagEdgesParent = function( edges, destination )
  local _, destinationEdge = tableFind( edges, function( edge )
    return edge[ 2 ] == destination
  end )

  return destinationEdge
    and destinationEdge[ 1 ]
    or nil
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

-- local subject = dagEdgesParent( edges, 'f' )
-- print( subject ) -- 'b'

-- local subject2 = dagEdgesParent( edges, 'a' )
-- print( subject2 ) -- nil

return dagEdgesParent
