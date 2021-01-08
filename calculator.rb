# calculator.rb

# ask the user for two numbers
# ask for an operation to perform
# perform the operation
# output the result

puts "Welcome to your own personal calculator!"

puts "What's the first number? "
number1 = gets.chomp
puts "The first number you've picked is #{number1}!"

puts "What's the second number? "
number2 = gets.chomp
puts "And second you've picked is " + number2 + "!"

puts "Which operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == "1"
  results = number1.to_i + number2.to_i
elsif operator == "2"
  results = number1.to_i - number2.to_i
elsif operator == "3"
    results = number1.to_i * number2.to_i
else 
  results = number1.to_f / number2.to_f
end

puts "The result is #{results}."
