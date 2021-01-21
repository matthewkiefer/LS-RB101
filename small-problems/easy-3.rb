# easy-3.rb

=begin
# Searching 101
# Problem: 
# Input: six numbers (assume int)
# Output: Response to search/found not found
# Data: string input parsed to ints, one array
# Algo: Search the array

arr = []

print "==> Enter the 1st number: "
arr << gets.to_i
print "==> Enter the 2nd number: "
arr << gets.to_i
print "==> Enter the 3rd number: "
arr << gets.to_i
print '==> Enter the 4th number: '
arr << gets.to_i
print "==> Enter the 5th number: "
arr << gets.to_i

print "==> Enter the last number: "
final = gets.to_i

if arr.include?(final)
  puts "The number #{final} is in the your list #{arr}."
else 
  puts "#{final} was not found in #{arr}."
end


# Arithmetic Integer

print " -> First number, please: "
first = gets.to_i

print " -> Second number, please: "
second = gets.to_i

puts " -> #{first} + #{second} = #{first + second}"
puts " -> #{first} - #{second} = #{first - second}"
puts " -> #{first} * #{second} = #{first * second}"
puts " -> #{first} / #{second} = #{first / second}"
puts " -> #{first} % #{second} = #{first % second}"
puts " -> #{first} ** #{second} = #{first ** second}"


# Counting the Number of Characters
# Inputs: word or multiple words (string)
# Outputs: String + count of chars
# Explicit requirements: Don't count spaces
# Implicit: Count commas and apostrophes
# Data: String, array of chars
# Algo: split word(s) to an array, then size array
# Return: n/a

print "Please write word or multiple words: "
words = gets.chomp

arr = words.gsub(" ", "").chars
count = arr.size

puts "There are #{count} characters in \"#{words}\"."

def multiply(int1, int2)
  int1 * int2
end

# n1 = [1, 2, 3]
# n2 = 2

# p multiply(n1, n2)

# Squaring an Argument
# Input
# Output
# Explicit requirements
# Implicit requirements
# Data structures
# Algo

def square(n)
  multiply(n, n)
end

# Guessed at recursion; brain too tired to really do it!
# def power(n, nth)
#   for power in (1..nth)
#     output = multiply(n, power(n, nth))
#   end
#   output
# end

p square(5)
# p power(2, 3)

# Exclusive Or

def xor?(bool1, bool2)
  if bool1 == true && bool2 == false
    return true
  elsif bool1 == false && bool2 == true
    return true
  else 
    return false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# Odd Lists

# def oddities(arr)
#   new_arr = []
#   arr.each_with_index { |element, idx| new_arr << element if idx.even? }
#   new_arr
# end

# def oddities(arr)
#   i = 0
#   odd_elements = []
#   loop do
#       break if i >= arr.size
#       odd_elements.push(arr[i]) if i.even?
#       i += 1
#   end
#   odd_elements
# end

def oddities(arr)
  new_arr = []
  while arr.size > 0
    new_arr.push(arr.shift)
    arr.shift if arr.size > 0
  end
  new_arr
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

=end

# Palindromic String (Part 1)

# Input - string
# Output - returns true/false
# Explicit requirements - punctuation and cases matter
# Implicit requirements - false unless true palindrome
# Questions - empty string?
# Data structures
# Algorithm 

# def palindrome?(str)
#   str == str.reverse
# end

# puts palindrome?('madam') == true
# puts palindrome?('Madam') == false          # (case matters)
# puts palindrome?("madam i'm adam") == false # (all characters matter)
# puts palindrome?('356653') == true

# def palindrome_array?(arr)
#   arr == arr.reverse
# end

# def palindrome_array_or_string?(arr)
#   arr1 = arr.to_a
#   arr1.to_s.reverse == arr.to_s
#   p arr1.to_s.reverse
#   p arr.to_s
# end

# def palindrome_either?(input)
#   arr = input.to_a.map { |item| item.to_s.downcase }
#   arr_backwards = arr.map { |item| item.reverse }
#   arr_backwards = arr_backwards.reverse
#   arr_backwards == arr
# end


# arr1 = [1, 2, 3]
# arr2 = ["a", 1, "a"]
# arr3 = ["ab", 1, "ab"]
# arr4 = ["ab", 1, "ba"]

# puts palindrome_either?(arr1)
# puts palindrome_either?(arr2)
# puts palindrome_either?(arr3)
# puts palindrome_either?(arr4)

# Palindromic String (Part 2) & Palindromic Numbers

def real_palindrome?(input) #works on strings and arrays
  # input to string, then downcase, then to array (split), then select each character if alphanumeric
  arr = input.to_s.downcase.split("")
  arr.select! { |item| item.match?(/[a-zA-Z0-9]/)}
  arr_backwards = arr.reverse
  arr_backwards == arr
end

puts real_palindrome?([[1], "a", 23, 3, 32, "A", [1]]) == true
puts real_palindrome?('madam') == true
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('test false') == false
puts real_palindrome?("") == true
puts real_palindrome?([]) == true
puts real_palindrome?(12321) == true
puts real_palindrome?(5) == true
puts real_palindrome?(12123) == false
