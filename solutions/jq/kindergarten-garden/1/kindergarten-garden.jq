{
  "C": "clover",
  "G": "grass",
  "R": "radishes",
  "V": "violets"
} as $plants |

(
  .student as $student |
  ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"] |
    index($student[:1])
) as $index |  # "Alice" -> 0, "Bob" -> 1, ...

.diagram |
  split("\n")                        |  # "RC\nGG" -> ["RC","GG"]
  map(split(""))                     |  #          -> [["R","C"],["G","G"]]
  map(.[$index * 2, $index * 2 + 1]) |  # select s, s+1 based on student index
  map($plants[.])
