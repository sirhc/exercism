def bottles:
  if . == 1 then "bottle" else "bottles" end
;

def capitalize:
  (.[0:1] | ascii_upcase) + .[1:]
;

def count:
  if . == 0 then "no more" else . | tostring end
;

def take:
  if . == 1 then "it" else "one" end
;

[
  range(.startBottles; .startBottles - .takeDown; -1) |
    "\(. | count | capitalize) \(. | bottles) of beer on the wall, \(. | count) \(. | bottles) of beer.",
    if . == 0 then
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take \(. | take) down and pass it around, \(. - 1 | count) \(. - 1 | bottles) of beer on the wall."
    end,
    ""
] | .[0:-1]
