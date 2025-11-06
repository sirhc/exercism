(.subject)                                   as $subject |
(.subject | ascii_downcase | explode | sort) as $test    |
.candidates | to_entries |
  map(.key = (.value | ascii_downcase | explode | sort)) |
  map(select((.value | ascii_downcase) != ($subject | ascii_downcase) and .key == $test)) |
  map(.value)
