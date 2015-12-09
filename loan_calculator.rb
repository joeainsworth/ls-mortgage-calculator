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

def get_input(msg)
  prompt(msg)
  loop do
    user_input = Kernel.gets().chomp()
    return user_input if valid_number?(input)
    prompt('Please input a valid amount.')
  end
end

Kernel.puts('=' * 35)
Kernel.puts('Welcome to the Mortgage Calculator!')
Kernel.puts('=' * 35)

loop do
  loan_amount = get_input('What is your total loan amount?')
  annual_interest_rate = get_input('What is your APR? (i.e. use 5.5 for 5.5%)')
  loan_duration = get_input('What is the duration of your loan? (in years)')

  # logic
  annual_interest_rate  = annual_interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months                = loan_duration.to_f * 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate *
                    (1 + monthly_interest_rate)**months) /
                    ((1 + monthly_interest_rate)**months - 1)

  output = <<-MSG
    #{'-' * 35}
    Your mortgage details
    #{'-' * 35}
    Total loan amount: $#{loan_amount}
    APR:               #{annual_interest_rate * 100}%
    Years:             #{(months / 12).to_i}
    #{'-' * 35}
    Monthly payment:   $#{monthly_payment.round(2)}
    #{'-' * 35}
  MSG

  Kernel.puts(output)

  prompt('Would you like to calculate any more monthly payments?')
  prompt('[y] yes [n] no')
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
