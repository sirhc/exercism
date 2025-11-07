def factor(divisor):
  if . <= 1 then
    # Base case #1: Can't factor past 1.
    []
  elif divisor * divisor > . then
    # Base case #2: We've exceeded the square root of the number, the number is prime.
    [.]
  elif (. % divisor) == 0 then
    # We found a factor, add it to the list and continue factoring the quotient.
    [divisor] + ( (. / divisor) | factor(divisor) )
  else
    # Past two, there will be no more even prime factors.
    if divisor == 2 then
      factor(3)
    else
      factor(divisor + 2)
    end
  end
;

.value | factor(2)
