def steps:
  if . < 1 then
    "Only positive integers are allowed" | halt_error
  else
    [ while(. > 1; if . % 2 == 0 then . / 2 else . * 3 + 1 end) ] | length
  end
;
