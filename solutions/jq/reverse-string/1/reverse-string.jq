def array_reverse:
  if length == 0 then [] else [.[-1]] + (.[:-1] | array_reverse) end;

.value | split("") | array_reverse | join("")
