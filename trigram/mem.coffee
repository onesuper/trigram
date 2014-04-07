class Memory
  constructor: ->
    @words = new Uint32Array(1 << 16)


  read: (offset) ->
    @words[offset]


  write: (offset, value) ->
    $('#mem' + offset).text('0x' + ('0000' + value.toString(16).toUpperCase()).substr(-4))
    @words[offset] = value