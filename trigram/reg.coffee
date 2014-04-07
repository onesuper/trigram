
class Reg
  constructor: (@name) ->
  	@value = 0
  	$('#' + @name).text('0x0000')

  read: ->
  	#$('#' + @name).css('background-color', 'gray')
  	@value


  write: (value) ->
  	$('#' + @name).text('0x' + ('0000' + value.toString(16).toUpperCase()).substr(-4))
  	#$('#' + @name).css('background-color', 'blue')
  	@value = value
