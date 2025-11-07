.phrase

# Start with some general cleanup.
| gsub("\\s"; "")
| gsub("^\\+"; "")
| gsub("[()-.]"; "")  # to improve: we could enforce the position of valid punctuation

# Check for errors.
| if test("[A-Za-z]") then "letters not permitted" | halt_error end
| if test("[^0-9]") then "punctuations not permitted" | halt_error end
| if length < 10 then "must not be fewer than 10 digits" | halt_error end
| if length > 11 then "must not be greater than 11 digits" | halt_error end
| if length == 11 then
    if .[0:1] == "1" then .[1:] else "11 digits must start with 1" | halt_error end
  end
| if .[0:1] == "0" then "area code cannot start with zero" | halt_error end
| if .[0:1] == "1" then "area code cannot start with one" | halt_error end
| if .[3:4] == "0" then "exchange code cannot start with zero" | halt_error end
| if .[3:4] == "1" then "exchange code cannot start with one" | halt_error end
