def calc:
  [ while( . > 0 ; . / 10 | floor ) // 0 | . % 10 ]  # 153 -> [3,5,1]
  | length as $length
  | map(pow(.; $length))                             #     -> [27,125,1]
  | add;                                             #     -> 153

.number == (.number | calc)
