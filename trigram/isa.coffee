

setcc = (val) ->
  if val < 0 then lc3.N = true
  if val == 0 then lc3.Z = true
  if val > 0 then lc3.P = true

add = (dest, src1, src2) ->
  if typeof src2 is "number"
    val = dest.write(src1.read() + src2)
  else
    val = dest.write(src1.read() + src2.read())
  setcc(val)

_and = (dest, src1, src2) ->
  if typeof src2 is "number"
    val = dest.write(src1.read() and src2)
  else
    val = dest.write(src1.read() && src2.read())
  setcc(val)

br = (n, z, p, pcoffset) ->
  if n and lc3.n or z and lc3.Z or p and lc3.P
    lc3.PC += pcoffset

jmp = (baseR) ->
  lc3.PC = baseR.read()

jsr = (pcoffset) ->
  lc3.R7 = lc3.PC  # save before call
  lc3.PC += pcoffset

jsrr = (baseR) ->
  lc3.R7 = lc3.PC
  lc3.PC = baseR.read()

ld = (dest, pcoffset) ->
  tmp = lc3.mem.read(lc3.PC + pcoffset)
  val = dest.write(tmp)
  setcc(val)

ldi = (dest, pcoffset) ->
  addr = lc3.mem.read(lc3.PC + pcoffset)
  tmp = lc3.mem.read(addr)
  val = dest.write(tmp)
  setcc(val)

ldr = (dest, baseR, pcoffset) ->
  tmp = lc3.mem.read(baseR.read() + pcoffset)
  val = dest.write(tmp)
  setcc(val)

lea = (dest, pcoffset) ->
  val = dest.write(lc3.PC + pcoffset)
  setcc(val)

_not = (dest, src) ->
  val = dest.write( ~src.read() )
  setcc(val)

ret = () ->
  lc3.PC = lc3.R7

st = (src, pcoffset) ->
  addr = lc3.PC + pcoffset
  lc3.mem.write(lc3.PC + pcoffset, src.read())

sti = (src, pcoffset) ->
  addr = lc3.mem.read(lc3.PC + pcoffset)
  lc3.mem.write(addr, src.read())

str = (src, baseR, offset) ->
  addr = baseR.read() + offset
  lc3.mem.write(addr, src.read())

trap = (vector) ->
  lc3.R7 = lc3.PC
  lc3.PC = lc3.mem.read(vector)






