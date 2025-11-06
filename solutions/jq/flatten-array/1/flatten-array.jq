def flatten_array:
  if   . == []                then []
  elif .[0] == null           then .[1:] | flatten_array
  elif .[0] | type == "array" then (.[0] | flatten_array) + (.[1:] | flatten_array)
  else                             [.[0]] + (.[1:] | flatten_array)
  end
;

.array | flatten_array
