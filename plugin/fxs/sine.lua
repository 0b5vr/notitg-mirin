return {
  func = function( context )
    local v = context.value
    local p = context.elapsed * context.params.freq + context.params.offset
    return v + context.params.amp * math.sin( 2.0 * math.pi * p )
  end
}
