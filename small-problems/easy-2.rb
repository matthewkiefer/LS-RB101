# easy-2.rb

=begin
# How Old is Teddy?
print "Please enter a name: "
name = gets.chomp
name = "Teddy" if name == ""

puts "#{name} is #{rand(20..200)} years old!"

# How big is the room?
print "Length? "
length = gets.chomp.to_f

print "Width? "
width = gets.chomp.to_f

puts "The area of the room is #{length * width} square meters, or #{length * width * 10.7639} square feet!"

# Tip calculator
# Input: bill, tip rate (percentage)
# Output: tip, total bill
# Transform: string to float

print "What is the bill? "
bill = gets.to_f

print "What is the percent you'd like to tip? "
percent = gets.to_f

tip = bill * percent * 0.01
total = bill + tip

puts "The tip is #{sprintf('%.2f', tip)} and the total bill is #{sprintf('%.2f', total.round(2))}."


# When will I Retire?
# Input: Age, desired year
# Output: Current year, retiring year, time in between
# Data: input strings, output ints
# Algo: Simple calculations
# - retiring year = current year + time left working
# - time left working = retire age - current age
# ?: Current year

print "How old are you? "
current_age = gets.to_i

print "At what age would you like to retire? "
goal_age = gets.to_i

year = Time.now.year
years_left = goal_age - current_age
retire_year = year + years_left

puts "It's #{year}. You will retire in #{retire_year}."
puts "You only have #{years_left} years left..."

# Greeting a User
# Input: name string
# Output: response with name, upcase'd if shouted
# Data: strings
# Algo: Read name, look for "!"; respond upcase'd if found

print "What's your name? "
name = gets.chomp

if name[-1] == "!"
  puts "HELLO #{name.delete("!").upcase} MY DUDE!"
else 
  puts "Hello, #{name}. Nice to meet you."
end

# Odd Numbers
# Input: none
# Output, 1 to 99 inclusive odd numbers, new line for each
# Data: integers, ranges
# Algo: times, or loops, or for 

for number in (1..99)
  puts number if number.odd?
end

num = 1
while num < 100
  puts num
  num += 2
end

num = 1
50.times do
  puts num
  num += 2
end

# Even Numbers
# Input: none
# Output: Even numbers, 2 to 98, newline

num = 2
loop do
  puts num
  num += 2
  break if num > 99
end

# Sum or Product of Consecutive Integers
# Input: int greater than 0, choice for sum or product
# Output: a sum or product of all numbers between 1 and int
# Examples: note, inclusive
# Data: int entry, string entry for choice
# Algo: 
# - eval choice then run one of two sets of code
# - sum, use for range to add up totals
# - - for i in 1 to num, sum is i sum + i
# - product, use counter with until loop
# - - i = 1, product = 1, while i <=, multipy
# - print total

def sum(num)
  # sum = 0
  # for number in 1..num
  #   sum += number
  # end
  # sum
  (1..num).reduce(0) { |total, iterator| total + iterator }
end

def product(num)
  # i = 1
  # product = 1
  # while i <= num
  #   product *= i  
  #   i += 1
  # end
  # product
  (1..num).reduce(1) { |total, int_as_count| total * int_as_count }
end

print "Please enter an int greater than 0: "
num = gets.chomp.to_i

print "Please choose 's' for sum or 'p' for product: "
choice = gets.chomp

case choice
when "s"
  puts sum(num)
when "p"
  puts product(num)
else
  puts "Does not compute."
end

=end

