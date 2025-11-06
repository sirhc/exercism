# Remove null values from the right end of an array. E.g.,
# [null, "foo", null, null] -> [null, "foo"]
def trim_nulls:
  if (. | length == 0) or .[-1] != null then
    .
  else
    .[0:-1] | trim_nulls
  end
;

(.lines | map(split("")))        as $rows |
($rows | map(length) | max // 0) as $max  |

reduce range($max) as $i ([]; . + [$rows | map(.[$i])]) |
map(trim_nulls)    |  # remove null values from right side
map(map(. // " ")) |  # map remaining null values (left) to space
map(join(""))
