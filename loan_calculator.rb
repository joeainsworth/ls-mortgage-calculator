# Ask the user for the following
# 1. Loan amount
# 2. Annual Percentage Rate (APR)
# 3. The loan duration
#
# P = L[c(1 + c)n]/[(1 + c)n - 1]
#
# L = loan_amount
# c = monthly interest rate
# n = months

require 'pry'

def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(input)
  integer?(input) || float?(input)
end

Kernel.puts('=' * 35)
Kernel.puts('Welcome to the Mortgage Calculator!')
Kernel.puts('=' * 35)

loop do
  prompt("What is your total loan amount?")
  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    if valid_number?(loan_amount)
      break
    else
      prompt("Please input a valid amount.")
    end
  end

  prompt("What is your Annual Percentage Rate (APR)?")
  prompt("For example, you can input 5.5 for 5.5%")
  annual_interest_rate = ''
  loop do
    annual_interest_rate = Kernel.gets().chomp()
    if valid_number?(annual_interest_rate)
      break
    else
      prompt("Please enter a valid APR.")
    end
  end

  prompt("What is the duration of your loan?")
  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()
    if valid_number?(loan_duration)
      break
    else
      prompt("Please enter a valid number.")
    end
  end


  # logic
  annual_interest_rate  = annual_interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months                = loan_duration.to_f * 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate * (1 + monthly_interest_rate) ** months) /
                    ((1 + monthly_interest_rate) ** months - 1)

  prompt("Your monthly payments are $#{format('%0.2f', monthly_payment)}")

  prompt("Would you like to calculate any more monthly payments? [y] yes [n] no")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

