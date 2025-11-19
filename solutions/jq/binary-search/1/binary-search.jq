def assert(condition; message):
  if condition then . else message | halt_error end;

def binary_search_(value; lrange; rrange):
  if lrange > rrange then
    null
  else
    ( (lrange + rrange) / 2 | floor ) as $index |
    if .[$index] == value then
      $index
    else
      if .[$index] > value then
        binary_search_(value; lrange; $index - 1)
      else
        binary_search_(value; $index + 1; rrange)
      end
    end
  end;

def binary_search(value):
  0                  as $lrange |
  ( . | length - 1 ) as $rrange |
  binary_search_(value; $lrange; $rrange);

.array as $array |
.value as $value |

$array | binary_search($value) | assert(. != null; "value not in array")
