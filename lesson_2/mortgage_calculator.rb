# mortgage_calculator

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  positive?(input) && (integer?(input) || float?(input))
end

def positive?(input)
  input.to_i > 0
end

loan_amount = nil
interest_rate = nil
loan_duration = nil

puts 'Welcome to mortgage calculator! Please enter the information.'
loop do # main loop. Do you want to continue
  loop do
    puts 'The loan amount:'
    loan_amount = gets.chomp
    number?(loan_amount) ? break : puts('Not a valid number try again')
  end

  loop do
    puts 'The interest rate? (Example: 5 for 5% or 2.5 for 2.5%)'
    interest_rate = gets.chomp
    number?(interest_rate) ? break : puts('Not a valid number, try again')
  end

  loop do
    puts 'Loan duration (in years)'
    loan_duration = gets.chomp
    number?(loan_duration) ? break : puts('Not a valid year, try again')
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i))

  puts "The monthly payment is: $#{monthly_payment.round(2)}"

  puts 'Again? (Y to continue)'
  awnser = gets.chomp.to_s
  break unless awnser.downcase.start_with?('y', 's')
end
