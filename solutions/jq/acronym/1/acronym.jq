.phrase |
  ascii_upcase        | # "Foo-bar Baz!" -> "FOO-BAR BAZ!"
  gsub("-"; " ")      | # "FOO-BAR BAZ!" -> "FOO BAR BAZ!"
  gsub("[^A-Z ]"; "") | # "FOO BAR BAZ!" -> "FOO BAR BAZ"
  split(" +"; null)   | # "FOO BAR BAZ" -> [ "FOO", "BAR", "BAZ" ]
  map(.[:1])          | # [ "FOO", "BAR", "BAZ" ] -> [ "F", "B", "B" ]
  join("")              # [ "F", "B", "B" ] -> "FBB"
