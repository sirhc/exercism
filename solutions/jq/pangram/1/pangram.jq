(
  .sentence
  | ascii_upcase
  | gsub("[^A-Z]"; "")
  | split("")
  | unique
  | join("")
) == "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
