def color_value:
  . as $color |
  ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] |
    to_entries[] |
    select(.value == $color) |
    .key
;

# I don't feel like being particularly clever here. Especially when there are
# small boundary conditions.

def reduce_value:
  if   . > 1000000000 then . / 1000000000 
  elif . > 1000000    then . / 1000000
  elif . > 1000       then . / 1000
  else .
  end
;

def ohm_unit:
  if   . > 1000000000 then "gigaohms"
  elif . > 1000000    then "megaohms"
  elif . > 1000       then "kiloohms"
  else "ohms"
  end
;

.colors[0:2] as $resistance |
.colors[2]   as $multiplier |
(($resistance | map(color_value) | join("") | tonumber) * pow(10; $multiplier | color_value)) as $value |
{
  value: ($value | reduce_value),
  unit:  ($value | ohm_unit),
}
