def removeLeadingZeroes:
  if .[0] == 0 and (length > 1) then
    .[1:] | removeLeadingZeroes
  else
    .
  end;

# https://cs.stackexchange.com/a/10321

def fromDigits($base):
  (. | reverse) as $digits |

  [ range(0; $digits | length) ]
  | reverse
  | map(. as $i | $digits[$i] * pow($base; $i))
  | add;

def toDigits($base):
  if . == 0 then
    [0]
  else
    [. % $base] + ( (. / $base | floor) | toDigits($base) )
  end;

.inputBase  as $inputBase  |
.outputBase as $outputBase |

if $inputBase  < 2 then "input base must be >= 2"  | halt_error end |
if $outputBase < 2 then "output base must be >= 2" | halt_error end |

if .digits | map(select(. < 0 or . >= $inputBase)) | length > 0 then
  "all digits must satisfy 0 <= d < input base" | halt_error
end |

if .digits | length > 0 then .digits else [0] end
| removeLeadingZeroes
| fromDigits($inputBase)
| toDigits($outputBase)
| reverse
| removeLeadingZeroes
