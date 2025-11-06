.moment |
if . | test("T") then . else "\(.)T00:00:00Z" end |
if . | test("Z") then . else "\(.)Z" end |
fromdate + 1000000000 | todate | sub("Z$"; "")
