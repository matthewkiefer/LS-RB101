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

=end

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

#
# english: [ ["hello", "hi", "good morning"], "hey" ]