def check_score(scores):
  . as $letter |
  scores | to_entries[] | select(.key | test($letter; "i")) | .value
;

{ "AEIOULNRST": 1, "DG": 2, "BCMP": 3, "FHVWY": 4, "K": 5, "JX": 8, "QZ": 10 } as $scores |
.word |
split("") |
map(check_score($scores)) |
add // 0
