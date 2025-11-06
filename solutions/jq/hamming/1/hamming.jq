[ (.strand1 | explode), (.strand2 | explode) ] |
  transpose |
  # number (71) and null (null) cannot be subtracted
  try (map(if .[0] - .[1] == 0 then 0 else 1 end)) catch ("strands must be of equal length" | halt_error) |
  add // 0
