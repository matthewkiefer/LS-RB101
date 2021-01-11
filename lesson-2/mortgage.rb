# mortgage.rb

=begin

Problem
Examples
Data structures
  -when do I convert to numbers?
Algorithm (flow chart?)
Code

Greet the user

  Collect the information: loan amount, APR, loan duration 
    -Verify (loop?)
  Calculate
    -convert first (or under verify)
  Send info to user
  Ask about again or end

START
SET variables: loan_amount, APR, loan_duration, mortgage
  
LOOP
  GET name
  IF not empty,
    PRINT greeting with name
  ELSE re-ask
END

LOOP # whole calculation
  LOOP
    PRINT Ask for loan_amount in dollars
    GET loan
    CHECK loan is valid int or float
      -call method
      IF valid, 
        SET loan_amount = loan
        break
      ELSE ask again
  END

  LOOP
    PRINT Ask for APR in % (ex 5% APR)
    GET APR
    CHECK for valid int or float
        -call method
      IF valid, 
        SET monthly_rate = (APR*.01) / 12
        break
      ELSE ask again
  END

  LOOP
    PRINT Ask for loan duration in years
    GET loan_years
    CHECK loan_years (int or float)
    if valid, 
      SET loan_duration = loan_years * 12
      BREAK
    ELSE ask again
  END
  
  SET mortgage = formula
  PRINT mortgage
  PRINT Again?
  GET input (y/n)
  If y
    Do nothing so loop returns to top
  Else BREAK
  END

PRINT farewell
END

=end

def prompt(message)
  puts "$$$>" + message
end

def greet
  name = ""
  while name == ""
    prompt "Welcome to Matt's Mortgage M-calculator. Please enter your name:"
    name = gets.chomp
  end
  prompt "Hello, #{name}"
end

def valid?(num)
  (num.to_i.to_s == num && num.to_i > 0) ||
    (num.to_f.to_s == num && num.to_f > 0)
end

def input_num_and_validate(type)
  loop do
    checked_number = gets.chomp
    return checked_number if valid?(checked_number)
    prompt "Please enter a valid (and positive) #{type}:"
  end
end

def calc_monthly_payment(mortgage, apr, loan_amount)
  length_in_months = mortgage.to_f * 12
  monthly_rate = (apr.to_f * 0.01) / 12

  monthly_payment = loan_amount.to_f * (monthly_rate /
                  (1 - (1 + monthly_rate)**(-length_in_months)))
end

greet

loop do # whole process loop
  prompt "Please enter the loan amount in dollars:"
  amount = input_num_and_validate("loan amount")

  prompt "Please enter the APR, example '4' for 4% APR:"
  apr = input_num_and_validate("APR without the percent sign")

  prompt "Please enter the duration of the mortage in years:"
  years = input_num_and_validate("mortgage length in years")

  prompt "The monthly payment is $#{format('%.2f', calc_monthly_payment(years, apr, amount))}"

  prompt "Run another? (y/n)"
  again = gets.chomp
  if again != "y"
    prompt "Have a nice day."
    break
  end
end
