class Decoder
  constructor: (@bincode) ->
    

  decode: ->
    switch @Op()
      when 0b0001  
        if @steer5() == 0
          console.log('R#{DR} = R#{SR1} + R#{SR2}')
        else
          console.log('R#{@DR} = R#{@SR1} + #{@imm5}')
      when 0b0101 
        if @steer5 is 0
          console.log('R#{@DR} = R#{@SR1} && R#{@SR2}')
        else
          console.log('R#{@DR} = R#{@SR1} && #{@imm5}')
      when 0b0000 
        console.log('n=#{@nflag}, z=#{@zflag}, p=#{@pflag}, go #{@PCoffset9}')
      when 0b1100 
        console.log('go R#{@BaseR}')
      when 0b0100 
        if @steer11 is 1
          console.log('call fun #{@PCoffset11}')
        else
          console.log('call fun R#{@BaseR}')
      when 0b0010 
        console.log('R#{@DR} = *[#{@PCoffset9}]')
      when 0b1010 
        console.log('R#{@DR} = **[#{@PCoffset9}]')
      when 0b0110 
        console.log('R#{@DR} = [R#{@BaseR} + #{@offset6}]')
      when 0b1110 
        console.log('R#{@DR} = #{@PCoffset9}')
      when 0b1001 
        console.log('R#{@DR} = ~ ${@SR}')
      when 0b1100 
        console.log('return')
      when 0b1000 
        console.log('rti')
      when 0b0011 
        console.log('[#{@PCoffset9}] = R#{@SR}')
      when 0b1011 
        console.log('**[#{@PCoffset9}] = R#{@SR}')
      when 0b0111 
        console.log('[R#{@BaseR} + #{@offset6}] = R#{@SR}')
      when 0b1111 
        console.log('trap #{@Trapvec8}')

  Op: ->
    @bincode >> 12

  DR: ->
    @bincode << 4 >> 13

  SR: ->
    @bincode << 4 >> 13

  SR1: ->
    @bincode << 7 >> 13

  SR2: ->
    @bincode << 13 >> 13

  imm5: ->
    @bincode << 11 >> 11

  PCoffset9: ->
    @bincode << 7 >> 7

  PCoffset11: ->
    @bincode << 5 >> 5

  Trapvec8: ->
    @bincode << 8 >> 8

  nflag: ->
    @bincode << 4 >> 15

  zflag: ->
    @bincode << 5 >> 15

  pflag: ->
    @bincode << 6 >> 15

  BaseR: ->
    @bincode << 7 >> 13

  offset6: ->
    @bincode << 10 >> 10

  steer5: ->
    @bincode << 10 >> 15

  steer11: ->
    @bincode << 4 >> 15