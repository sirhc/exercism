def sieve:
  .[0] as $divisor |
  if . | length > 0 then
    [.[0]] + (.[1:] | map(if . % $divisor == 0 then empty else . end) | sieve)
  else
    []
  end
;

[range(2; .limit + 1)] | sieve
