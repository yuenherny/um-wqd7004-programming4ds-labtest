# Q2

# Matric number: S2121801
str_arg = "Matric : S2121801"

checkString = function(str_arg) {
  
  total_char = nchar(str_arg, "chars")
  
  library(stringr)
  total_digit = str_count(str_arg, "[0-9]")
  total_whitepace = str_count(str_arg, " ")
  total_symbol = str_count(str_arg, ":")
  total_letter = total_char - total_digit - total_whitepace - total_symbol
  
  cat("The argument is", str_arg, "\n The number of letters are", total_letter, "\n The number of digits are", total_digit)
  
}

checkString(str_arg)


