

add = (dest, src1, src2) ->
  dest.write(src1.read() + src2.read())

lc3.add = add