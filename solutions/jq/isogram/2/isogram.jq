# .phrase                  | # input: { "phrase": "..." }
# ascii_upcase             | # "a" is equal to "A"
# gsub("[^[:upper:]]"; "") | # we don't care about non-letters
# explode                  | # an array of ASCII values
# group_by(.)              | # ... group them together
# map(length)              | # ... count them
# any(. > 1)               | # true if any letters are repeated
# not                        # ... which means it's not an isogram

.phrase                 | # input: { "phrase": "..." }
ascii_upcase            | # "a" is equal to "A"
[ scan("[[:alpha:]]") ] | # only continue with letters
length == (unique | length)
