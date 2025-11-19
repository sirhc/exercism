def make_line($current; $letter):
  if $current == 0 then
    # E.g., [ . . . A . . . ]
    [
      reduce range(0; $letter) as $i ([]; . + [46]),
      $current + 65,
      reduce range(0; $letter) as $i ([]; . + [46])
    ]
  else
    # E.g., [ . . B . B . . ]
    [
      reduce range(0; $letter - $current) as $i ([]; . + [46]),
      $current + 65,
      reduce range(0; $current * 2 - 1) as $i ([]; . + [46]),
      $current + 65,
      reduce range(0; $letter - $current) as $i ([]; . + [46])
    ]
  end | flatten | implode;

# A = 65
(.letter | explode | first) - 65 as $letter |

(reduce range(0; $letter + 1) as $i ([]; . + [make_line($i; $letter)])) +
  (reduce ([range(0; $letter)] | reverse)[] as $i ([]; . + [make_line($i; $letter)]))
| join("\n")
