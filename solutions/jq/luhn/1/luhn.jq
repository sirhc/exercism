split("") |
map(select(. != " ")) |
if . | length < 2 then
  false
else
  try (
    reverse |
    map(. | tonumber) |
    to_entries |
    map(if .key % 2 == 1 then .value * 2 else .value end) |
    map(if . > 9 then . -9 else . end) |
    add % 10 == 0
  ) catch false
end
