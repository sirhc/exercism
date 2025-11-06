# Now I have two problems. :)
# https://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/

def encode_helper:
  . as $input |
  if $input | length == 0 then
    []
  else
    # Use a backreference to match as many of the same character as possible.
    # Then let the capture tell us how long it was.
    match("^(.)\\1*") |
    [ if .length > 1 then .length else "" end, .string[0:1] ] + ($input[.length:] | encode_helper)
  end
;

def encode:
  encode_helper | join("")
;

def decode_helper:
  . as $input |
  if $input | length == 0 then
    []
  else
    # If the number at the front doesn't match, the offset will be -1 and the
    # string will be null. We can easily default to 1.
    #
    # Conveniently, the lengths of the captures will tell us how much of the
    # string to chop off for the next call to decode_helper.
    match("^(\\d+)?(.)") | .captures |
    (.[0].string // "1" | tonumber) as $length |
    (.[1].string)                   as $char   |
    reduce range($length) as $i ([]; . + [$char]) + ($input[(map(.length) | add):] | decode_helper)
  end
;

def decode:
  decode_helper | join("")
;
