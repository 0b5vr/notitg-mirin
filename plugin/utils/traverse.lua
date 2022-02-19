local tableFilter = require( 'utils/tableFilter' )
local tableHas = require( 'utils/tableHas' )

-- Generic traverse function.
--
-- It performs Depth-First Search.
--
-- The `traverser` function will be executed for each descendants.
-- You need to return their "children" in an array.
-- If you want to stop the traversal, return `false` instead.
--
-- @param root The "root" node
-- @param traverser The traverse function
local traverse = function( root, traverser )
  local nodesNeedProcess = { root }
  local nodesSeen = { root }

  while table.getn( nodesNeedProcess ) > 0 do
    local currentNode = table.remove( nodesNeedProcess, 1 )

    local children = traverser( currentNode )

    if not children then
      break
    end

    local nodesFound = tableFilter( children, function( node )
      return not tableHas( nodesSeen, node )
    end )
    print(nodesFound)

    -- insert to the top of nodesNeedProcess
    for i, node in ipairs( nodesFound ) do
      table.insert( nodesNeedProcess, i, node )
      table.insert( nodesSeen, node )
    end
  end
end

-- local a = {
--   name = 'a',
--   children = {
--     {
--       name = 'b',
--       children = {
--         {
--           name = 'c',
--           isFunky = true,
--         },
--         {
--           name = 'd',
--         }
--       },
--     },
--     {
--       name = 'e',
--       children = {
--         {
--           name = 'f',
--         },
--         {
--           name = 'g',
--         },
--       },
--     },
--   },
-- };

-- local nodeNames = {};
-- traverse( a, function( node )
--   table.insert( nodeNames, node.name );
--   return node.children or {};
-- end );

-- print( table.concat( nodeNames, ', ' ) ) -- 'a, b, c, d, e, f, g'

return traverse
