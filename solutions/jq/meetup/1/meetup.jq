.year      as $year  |
.month     as $month |  # note: months are zero-based in the C library
.week      as $week  |
.dayofweek as $dayofweek | (["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"] | index($dayofweek)) as $dayofweek |

[ range(1; 32) ] |
  map(
    "\($year)-\($month)-\(.)" |               # start by creating 31 days for the given month (not all will be valid, obviously)
    strptime("%Y-%m-%d") | mktime | gmtime |  # a round-trip to turn "YYYY-02-31" into, e.g., "YYYY-03-03"
    select(.[1] == $month - 1) |              # remove any dates that rolled over into the next month ("Thirty Days Hath September ...")
    select(.[6] == $dayofweek)                # only consider the desired day of the week
  ) |

  # Once we have the list of, e.g., all Mondays, it's straightforward to pick the desired week.
  if   $week == "first"  then .[0]
  elif $week == "second" then .[1]
  elif $week == "third"  then .[2]
  elif $week == "fourth" then .[3]
  elif $week == "last"   then .[-1]
  elif $week == "teenth" then (.[] | select(.[2] >= 13 and .[2] <= 19))
  else
    ("Error: Invalid week: \($week)\n" | halt_error(1))
  end |

  # Convert it to a human-readable date string, and done.
  strftime("%Y-%m-%d")
