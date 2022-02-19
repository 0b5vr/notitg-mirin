require( 'automaton' )
local traverse = require( 'utils/traverse' )
local dagEdgesResolve = require( 'dag/dagEdgesResolve' )

-- load fx definitions
local fxs = {
  sine = require( 'fxs/sine' ),
}

-- load automaton serialized data
local data = require( 'automaton-data' )

-- initialize automaton
automaton = Automaton.new( data, { fxDefinitions = fxs } ) -- GLOBAL
auto = automaton.auto -- GLOBAL

-- connect automaton to mirin template
for name_ in pairs( automaton.mapNameToChannel ) do
  local name = name_
  ease { 0, 1E5, function()
    return auto( name )
  end, 1, name }
end

-- set update command
perframe { 0, 1E5, function( beat )
  -- get song time
  local time

  if GAMESTATE.GetSongTime then
    time = GAMESTATE:GetSongTime() -- nITG have a proper song time!
  else
    -- Workaround for oITG: https://discord.com/channels/227650173256466432/227819834480656384/635806437712592896
    time = PREFSMAN:GetPreference( 'GlobalOffsetSeconds' ) - ( 0.374 - 0.349 ) + self:GetSecsIntoEffect()
  end

  -- update automaton
  automaton:update( time )

  -- connect to automaton-electron via automaton-notitg-glue
  -- it is not required to make automaton work on the game
  if GAMESTATE.SetExternal then
    local floorTime = math.floor( time )
    local fracTime = time - floorTime

    GAMESTATE:SetExternal( 2, floorTime )
    GAMESTATE:SetExternal( 3, math.floor( 1E6 * fracTime ) )
  end
end }
