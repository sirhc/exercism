def proverb:
  if . | length < 2 then
    empty
  else
    "For want of a \(.[0]) the \(.[1]) was lost.", (.[1:] | proverb)
  end
;

(.strings | first) as $first |
[
  .strings | proverb,
  if $first then "And all for the want of a \($first)." else empty end
]
