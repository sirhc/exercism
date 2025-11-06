def toRna:
  {"G": "C", "C": "G", "T": "A", "A": "U"} as $map |
  split("") |
  map(($map).[.]) |
  join("")
;
