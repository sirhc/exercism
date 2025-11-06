.legacy |
[
  to_entries[] |
  .key as $score |
  .value |
  map({ "key": (. | ascii_downcase), "value": $score | tonumber })
] |
add |
sort_by(.key) |
from_entries
