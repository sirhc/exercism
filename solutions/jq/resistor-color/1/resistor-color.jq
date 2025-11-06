["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"] as $values |
if .property == "colorCode" then
  .input.color as $color |
  $values | to_entries[] | select(.value == $color) | .key
elif .property == "colors" then
  $values
else
  empty
end
