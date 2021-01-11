# calculator.rb

# ask the user for two numbers
# ask for an operation to perform
# perform the operation
# output the result

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt "Welcome to your own personal calculator! Enter your name:"

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt "Valid name, please"
  else break
  end
end

prompt "Hi, #{name}!"

loop do # main loop
  number1 = ""
  number2 = ""
  loop do
    prompt "What's the first number? "
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt("Hm, invalid; try again?")
    end
  end
  prompt "The first number you've picked is #{number1}!"

  loop do
    prompt "What's the second number? "
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt("No, try again")
    end
  end
  prompt "And second you've picked is " + number2 + "!"

  operator_prompt = <<-MSG
Which operation would you like to perform?
    1) add
    2) subtract  
    3) multiply 
    4) divide
  MSG

  prompt(operator_prompt)
  operator = gets.chomp

  loop do
    if %w(1 2 3 4).include?(operator)
      break
    else
      puts "Please choose 1, 2, 3, or 4"
      operator = gets.chomp
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result =  case operator
            when "1"
              number1.to_i + number2.to_i
            when "2"
              number1.to_i - number2.to_i
            when "3"
              number1.to_i * number2.to_i
            when "4"
              number1.to_f / number2.to_f
            end

  prompt "The result is #{result}."

  prompt "Do you want to perform another calculation? (Y to calculate again)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt "Thanks for calculating!"
