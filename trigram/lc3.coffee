
console.log("Welcome to LC-3's world")

lc3.R0 = new Reg('R0')
lc3.R1 = new Reg('R1')
lc3.R2 = new Reg('R2')
lc3.R3 = new Reg('R3')
lc3.R4 = new Reg('R4')
lc3.R5 = new Reg('R5')
lc3.R6 = new Reg('R6')
lc3.R7 = new Reg('R7')
lc3.PC = 0
lc3.N = false
lc3.Z = false
lc3.P = false
lc3.PSR = 0
lc3.cycle = 0

lc3.add = add
lc3.and = _and
lc3.br = br
lc3.jsr = jsr
lc3.jsrr = jsrr
lc3.ld = ld
lc3.ldi = ldi
lc3.ldr = ldr
lc3.lea = lea
lc3.not = _not
lc3.ret = ret
lc3.st = st
lc3.sti = sti
lc3.str = str
lc3.trap = trap


lc3.mem = new Memory





for address in [0...256]
  $('#memory-table').append( '<tr><td class="mem-address">' + ("0000" + address.toString(16).toUpperCase()).substr(-4) + '</td><td class="mem-content" id="mem' + address + '">0x' + ('0000' + lc3.mem.words[address].toString(16)).substr(-4)  + '</td></tr>' );


for i in [0...256]
  $('#memory-selector').append('<option value="' + i + '">0x' + ("00" + i.toString(16).toUpperCase()).substr(-2) + '</option>')


$('#memory-selector').on 'change', (evt) =>
  $('#memory-table').empty()
  start = $('#memory-selector').val() * (1 << 8)
  end = start + (1 << 8)
  for address in [start...end]
    $('#memory-table').append( '<tr><td class="mem-address">' + ("0000" + address.toString(16).toUpperCase()).substr(-4) + '</td><td class="mem-content">0x' + ('0000' + lc3.mem.words[address].toString(16)).substr(-4)  + '</td></tr>' );



