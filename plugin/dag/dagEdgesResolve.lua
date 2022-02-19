local dagEdgesParent = require( 'dag/dagEdgesParent' )
local tableIndexOf = require( 'utils/tableIndexOf' )
local tableClone = require( 'utils/tableClone' )
local tableFilter = require( 'utils/tableFilter' )
local tableMap = require( 'utils/tableMap' )

-- Resolve dag dependency relationship and give you a correct order.
--
-- @param edges An array of dag edges
-- @param nodes An array of dag nodes
local dagEdgesResolve = function( edges, nodes )
  local order = {}

  local nodeSet = tableClone( nodes )
  local tempEdges = tableClone( edges )

  while table.getn( tempEdges ) > 0 do
    nodeSet = tableFilter( nodeSet, function( node )
      -- is this an entrypoint?
      local hasParents = dagEdgesParent( tempEdges, node ) ~= nil

      if not hasParents then
        table.insert( order, node )

        -- delete the structure of tempEdges from entrypoint side
        tempEdges = tableFilter( tempEdges, function( edge )
          return edge[ 1 ] ~= node
        end )

        -- remove from nodeSet
        return false
      end

      return true
    end )
  end

  -- insert terminator nodes
  tableMap( nodeSet, function( node )
    table.insert( order, node )
  end )

  return order
end

-- local nodes = {
--   'alpha',
--   'color',
--   'isect',
--   'p',
--   'rd',
--   'resolution',
--   'ro',
--   'time',
-- }

-- local edges = {
--   { 'isect', 'color' },
--   { 'p', 'rd' },
--   { 'rd', 'isect' },
--   { 'resolution', 'p' },
--   { 'ro', 'isect' },
--   { 'time', 'rd' },
--   { 'time', 'ro' },
-- }

-- local subject = dagEdgesResolve( edges, nodes )
-- print( table.concat( subject, ', ' ) )

return dagEdgesResolve
