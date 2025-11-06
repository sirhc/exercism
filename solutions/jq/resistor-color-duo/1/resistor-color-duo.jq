def color_value:
  . as $color |
  ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] |
    to_entries[] |
    select(.value == $color) |
    .key
;

# Silly, since we have at most a two-element array, but why not?
def remove_zeroes:
  if . == [] then []
  elif .[0] == 0 then .[1:] | remove_zeroes
  else .
  end
;

.colors[0:2] |
  map(color_value) |
  remove_zeroes |
  join("")
