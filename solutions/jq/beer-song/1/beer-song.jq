def verse:
  if . == 0 then
    "",
    "Go to the store and buy some more, 99 bottles of beer on the wall.",
    "No more bottles of beer on the wall, no more bottles of beer."
  elif . == 1 then
    "",
    "Take it down and pass it around, no more bottles of beer on the wall.",
    "1 bottle of beer on the wall, 1 bottle of beer."
  elif . == 2 then
    "",
    "Take one down and pass it around, 1 bottle of beer on the wall.",
    "2 bottles of beer on the wall, 2 bottles of beer."
  else
    "",
    "Take one down and pass it around, \(. - 1) bottles of beer on the wall.",
    "\(.) bottles of beer on the wall, \(.) bottles of beer."
  end
;

[ range(.startBottles - (.takeDown - 1); .startBottles + 1) | verse ] | .[1:] | reverse
