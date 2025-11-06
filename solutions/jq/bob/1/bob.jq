def is_silent:
  . | gsub("[[:space:]]"; "") | . == ""
;

def is_shout:
  . | ([match("[[:upper:]]"; "")] | length > 0) and ([match("[[:lower:]]"; "")] | length == 0)
;

def is_question:
  . | [match("\\?[[:space:]]*\\z"; "")] | length > 0
;

.heyBob |
if   is_shout and is_question then "Calm down, I know what I'm doing!"
elif is_shout                 then "Whoa, chill out!"
elif is_question              then "Sure."
elif is_silent                then "Fine. Be that way!"
else                               "Whatever."
end
