[
  "eggs",          # 1
  "peanuts",       # 2
  "shellfish",     # 4
  "strawberries",  # 8
  "tomatoes",      # 16
  "chocolate",     # 32
  "pollen",        # 64
  "cats"           # 128
] as $allergens |

.property   as $property |
.input.item as $item     |

.input.score | [ while( . > 0 ; . / 2 | floor ) // 0 | . % 2 ] as $results |  # e.g., 17 -> [1,0,0,0,1]

reduce range(0; $allergens | length) as $i ([]; if $results[$i] == 1 then . + [$allergens[$i]] else . + [] end)
| if   $property == "allergicTo" then . | index($item) != null
  elif $property == "list"       then .
  else "unknown property: \($property)" | halt_error end
