def slice(sliceLength):
  if (. | length) < sliceLength then
    empty
  else
    .[0:sliceLength], (.[1:] | slice(sliceLength))
  end
;

. as $input |
if ($input).series == "" then
  "series cannot be empty" | halt_error
elif ($input).sliceLength == 0 then
  "slice length cannot be zero" | halt_error
elif ($input).sliceLength < 0 then
  "slice length cannot be negative" | halt_error
elif ($input).sliceLength > (($input).series | length) then
  "slice length cannot be greater than series length" | halt_error
else
  ($input).series | [slice(($input).sliceLength)]
end
