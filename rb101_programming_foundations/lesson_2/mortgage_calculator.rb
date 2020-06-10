# RB101 Programming Foundations > Lesson 2: Small Programs > Assignment: Mortgage / Car Loan Calculator

=begin

# Information Required
the loan amount
the Annual Percentage Rate (APR)
the loan duration

# Calculate
monthly interest rate
loan duration in months

# Formula
m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

m = p * (j / (1 - (1 + j)**(-n)))

=end

def prompt(message)
  puts "=> #{message}"
end

loop do #START
  prompt("Mortgage Calculator")
  prompt("-------------------")

  prompt("Enter the loan amount:")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("Enter the Annual Percentage Rate(APR):")
  apr = ''
  loop do
    apr = gets.chomp
    if apr.empty? || apr.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("Enter the loan duration(years):")
  loan_duration = ''
  loop do
    loan_duration = gets.chomp
    if loan_duration.empty? || loan_duration.to_i < 0
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  monthly_interest_rate = (apr.to_f / 100) / 12
  loan_duration_months = loan_duration.to_i * 12

  monthly_payment = loan_amount.to_f * 
                         (monthly_interest_rate / 
                         (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
                        
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
  
  prompt("Would you like to make another calculation?(yes/no)")
  answer = ''
  loop do
    answer = gets.chomp
    if answer.downcase == "yes"
      break
    elsif answer.downcase == "no"
      prompt("Thank you for using Mortgage Calculator! Good bye.")
      exit
    else
      prompt("Please respond with a 'yes' or 'no' to continue.")
    end
  end
  
end