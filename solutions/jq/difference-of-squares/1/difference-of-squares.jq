def squareOfSum:         . as $input | ( [ range(1; $input + 1) ] | add ) * ( [ range(1; $input + 1) ] | add );
def sumOfSquares:        . as $input | [ range(1; $input + 1) ] | map(. * .) | add;
def differenceOfSquares: . as $input | ($input | squareOfSum) - ($input | sumOfSquares);

.property     as $property |
.input.number as $number   |

if   $property == "squareOfSum"         then $number | squareOfSum
elif $property == "sumOfSquares"        then $number | sumOfSquares
elif $property == "differenceOfSquares" then $number | differenceOfSquares
else
  "Unknown property: \($property)\n" | halt_error
end
