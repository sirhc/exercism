.number |
  [ while(. > 0; . / 2 | floor) ] | # 89 -> [ 89, 44, 22, 11, 5, 2, 1 ] (deconstruct)
  map(select(. % 2 == 1))         | #    -> [ 89, 11, 5, 1 ] (filter odd / 1 bits)
  map(1)                          | #    -> [ 1, 1, 1, 1 ]
  add // 0                          #    -> 4 (count of 1 bits, 0 results in null)
