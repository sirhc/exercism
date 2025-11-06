.radicand as $n |
if .radicand == 1 then 1 else
  [ .radicand | while(. * . - $n > 0.0001; (. + $n / .) / 2) ] | last | trunc
end
