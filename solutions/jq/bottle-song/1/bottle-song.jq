def to_word(n):
  ["No", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"][n];

def to_bottles(n):
  "\( to_word(n) ) green \( if n == 1 then "bottle" else "bottles" end )";

def to_hanging(n):
  "\( to_bottles(n) ) hanging on the wall";

def verse(n):
  [
    "\( to_hanging(n) ),",
    "\( to_hanging(n) ),",
    "And if \( to_bottles(1) | ascii_downcase ) should accidentally fall,",
    "There'll be \( to_hanging(n - 1) | ascii_downcase ).",
    ""
  ]
;

.startBottles as $startBottles |
.takeDown     as $takeDown |

reduce range(0; $takeDown) as $verse ([]; . + verse($startBottles - $verse))
| .[:-1]  # remove the trailing empty line
