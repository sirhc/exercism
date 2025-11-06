def encode:
  # a - 25 -> -25 | abs -> 25 = z
  # z - 25 ->   0 | abs ->  0 = a
  def map_letter: . - 25 | length;

  . | explode | map(
    if   . >= 48 and . <=  57 then .                        # digit
    elif . >= 65 and . <=  90 then . - 65 | map_letter + 97 # uppercase letter
    elif . >= 97 and . <= 122 then . - 97 | map_letter + 97 # lowercase letter
    else                           empty                    # anything else
    end
  ) | implode
;

if   .property == "encode" then .input.phrase | encode | gsub("(?<x>.....)(?!$)"; "\(.x) ")
elif .property == "decode" then .input.phrase | encode
else                            "unknown property: \(.property)" | halt_error
end
