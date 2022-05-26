#Q1

# Matric number: S2121801
principal = 10000
interest = 4 # yearly interest rate in %
number_of_months = 12

# Monthly payment
monthly_payment_func = function(principal, interest, number_of_months) {
  
  return((principal * interest / (12*100)) / ((1 - (1 + interest / (12*100))^(-number_of_months))))
  
}

# Principal portion due
princ_portion_due_func = function(monthly_payment, interest, number_of_months, month_under_consideration) {
  
  return(monthly_payment * (1 + interest / (12*100))^-(1+number_of_months-month_under_consideration))
  
}

# Interest due
interest_due_func = function(monthly_payment, princ_portion_due) {
  
  return(monthly_payment - princ_portion_due)
  
}

# Remaining principal balance due
remaining_princ_bal_due_func = function(interest_due, interest, princ_portion_due){
  
  return(interest_due / (interest / (12*100)) - princ_portion_due)
  
}

df = data.frame(matrix(ncol = 6, nrow = number_of_months)) 
colnames(df) = c('Month', 'Monthly_Payment', 'Principal', 'Interest', 'Unpaid_Balance', 'Total_Interest')

total_interest = 0
for (month in 1:number_of_months) {
  
  monthly_payment = monthly_payment_func(principal, interest, number_of_months)
  princ_due = princ_portion_due_func(monthly_payment, interest, number_of_months, month)
  interest_due = interest_due_func(monthly_payment, princ_due)
  unpaid_bal = remaining_princ_bal_due_func(interest_due, interest, princ_due)
  total_interest = total_interest + interest_due
  
  df$Month[month] = month
  df$Monthly_Payment[month] = monthly_payment
  df$Principal[month] = princ_due
  df$Interest[month] = interest_due
  df$Unpaid_Balance[month] = unpaid_bal
  df$Total_Interest[month] = total_interest
}

df

















