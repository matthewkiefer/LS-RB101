# medium_1.rb
require "pry"

# Rotation (Part 1)

# Problem
#   Input: Array
#   Output: New array (returned); don't change original
# Examples
# Data Struct's: two arrays. 
# Algo: Second element is now the first. i == 1 in original is now i == 0 in new.
#   Put the first elemenet of original array at the end of the new new array - index[arr.size-1]

def rotate_array(arr)
  rotated_arr = []
  counter = 0
  
  while counter < arr.size
    rotated_counter = counter - 1
    if counter == 0
      rotated_arr[arr.size-1] = arr[counter]
    else
      rotated_arr[rotated_counter] = arr[counter]
    end

    counter += 1
  end

  rotated_arr
end

def rotate_string_or_int(str_or_int)
  if str_or_int.class == Integer
    is_int = true
  else
    is_int = false
  end

  split_input = str_or_int.to_s.chars
  rotated_string = rotate_array(split_input).join

  final_output = is_int ? rotated_string.to_i : rotated_string

end

p rotate_string_or_int(123)
p rotate_string_or_int("123")
p rotate_string_or_int("abc")
# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# Rotation (Part 2)

# Rotate x digits of a number, where x counted from the right
# I'll need a way to select the digits - array, or string with slice, range

# Let's practice with a string, using [] to grab. x will be [-x, string.length-1] or slice (-x, string.length)
# Then rotate, then join, then to integer

def rotate_rightmost_digits(number, digits)
  string_number = number.to_s
  # binding.pry
  rotated_digits_string = rotate_string_or_int(string_number[-digits..-1])
  static_portion = string_number[0..-digits-1]
  output_num = (static_portion + rotated_digits_string).to_i
end

# p rotate_rightmost_digits(12345, 4)
# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# Rotation (Part 3)

# Recursion?
# Problem: Rotate a number left, then, left again with all the digits except the first, then again, up to 
#   rotating the last two digits. 
#   -> So the rotation and size down process happens size - 1 times
#   -> Or, size times, and the final rotation just returns the last digit

# Recursive: call on self, but each next layer needs to work on the already-rotated number
#   So rotate then call self, or return single digit
#   -> self call is on number_string[1..-1] -> need to be an int though
#     number.to_s[1..-1].to_i

# My helper method is a bit unhelpful, since it works on numbers intead of strings

# def max_rotation(number)
#   number_length = number.digits.length

#   number = rotate_rightmost_digits(number, number_length)

#   if number_length == 1
#     return number
#   else
#     num_with_first_digit_removed = number.to_s[1..-1].to_i
#     rotate_rightmost_digits(num_with_first_digit_removed, number_length - 1)
#   end
#   number
# end


# New try for recursion, not using rightmost digits
# Convert to string
# return num_string if num_length == 1
# Rotate
# call self on shorter string -> set short version of current string to call of short version
# (return number?)
def max_rotation_recursive(number)
  number_string = number.to_s

  return number_string.to_i if number_string.length == 1

  number_string = rotate_string_or_int(number_string)
  number_string[1..-1] = max_rotation_recursive(number_string[1..-1]).to_s

  number_string.to_i
end

# p max_rotation_recursive(735291) == 321579
# p max_rotation_recursive(3) #== 3
# p max_rotation_recursive(35) == 53
# p max_rotation_recursive(105) == 15 # the leading zero gets dropped
# p max_rotation_recursive(8_703_529_146) #== 7_321_609_845 # Returns false; a zero disappears in the middle

# Normal, calling rotate_rightmost_digits
# Convert to string, call on full string, then call on smaller strings, each time 
# swapping in the newly-rotated string
def max_rotation(number)
  number = number.to_s
  
  i = number.length
  while i > 0
    number =  rotate_rightmost_digits(number, i).to_s
    # binding.pry
    i -= 1
  end
  number.to_i
end

# p max_rotation(123)
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# 1000 Lights
# Problem
  # Switches labeled 1 to n - an array of true/falses. (False == off).
  # n times, I'll iterate
  # Each time, I *** flip some switches
    # (Figure out exact math)
# Examples
  # First time, skip 0
  # 2nd, skip 1, do one, etc.
  # 3rd, skip 2, do 1, skip 2
    # Select?
# Data Structures: initial array, counter for which time n, return array
  # a subset (select): which are true, the ** index ** of the trues

# Algo:
  # Array of n falses to start
  # Set counter?
  # n times do one thing:
    # ** iterate through and:
      # on the index+1'th time, 
        # skip i-1, then flip, then skip i-1, etc

        # for i in (1..n) do
          # skip i-1, flip i

            # select divisible by i

        # end

  # Do this n times
  # At the end, select those that are true
    # Get the index starting at 1 (so actual idx + 1)
    # index + 1 of true selections goes into a new array

def flip_lights(n)
  lights = Array.new(n, false)
  # Number of times walking down the line

  n.times do |n|

    # selected_switches = lights.each_with_index do |light, idx|
    lights.map!.with_index do |light, idx|
    if (idx + 1) % (n + 1) == 0
        light == true ? false : true
    else 
      light
    end

  end
    

    # for i in 1..n do

# Firs time through, toggle if index+1 is divisible by i (1)
# Second time, toggle if index+1 is divisible by i (2)

    # if lights[i-1] % i 

  end
  final_state = []
  lights.each_with_index do |light, idx|
    if light == true
      final_state << idx + 1
    end
  end

  final_state
end

# p flip_lights(10)

# Diamonds! - better for notes, sharing

# Formatting printing dynamically
# How can I change output based on input?
  # string multiplication
  # concatentation
  # Arrays with n elements


# Problem: Print a diamond, max_dimension tall and wide 
# n = max_dimension

# Examples: extra space at top of output
  # Positive odd integers (loop to reject others)
  # Interior lines are multiples of 2 (aka 1, 3, 5 stars)

# Data Structures: array of arrays? Likely not; use loops to populate array
  # for each line

# Take in input
# Understand and formulate correct sizing
  # location of first and central star (center variable)
  # add stars on either side
  # at max stars, duplicate top half on bottom
    # (save the top arrays for easy duplication?)

# Central star of diamond(1) is index 0 (special case)
# diamond 3 is idx 1
# diamond 9 is 4
# => center star is (n-1)/2

# diamond 9:
# ln 1, star at center
# 2, star at center -1, center, center +1
# 3, star at center -2, -1, center, 1, 2
# -> write into and delete out of array 

# Array that has n elements, spaces
# 
# loop, i = 0: center star, print
# loop, i = 1: add star i before and i after, print
#     when i is center_star size, then do second half

def diamond(max_dimension)
  center_point = (max_dimension-1) / 2
  stars = Array.new(max_dimension, " ")
  stars[center_point] = "*"

  puts

  i = 0
  loop do
    stars.each { |star| print star }
    puts

    break if i == center_point

    # for modification:
    stars[center_point - i] = " "
    stars[center_point + i] = " "

    i += 1

      stars[center_point - i] = "*"
      stars[center_point + i] = "*"

    end

  loop do
    
    break if i == 0
       
    stars[center_point - i] = " "
    stars[center_point + i] = " "
    
    i -= 1

    # Modified version
    stars[center_point - i] = "*"
    stars[center_point + i] = "*"

    stars.each { |star| print star }
    puts

  end
end

# diamond(9)

# Stack Machine Interpretation
# Problem: parse commands that operate on two different data structures:
  # the stack and the register.
  # Input: series of commands and integers manipulating the stack and register
  # Output: PRINT to output; otherwise, just manipulation

# Examples
  # Strings read left to right. Each word or int is a command
  # Separated by spaces

# Data structures:
  # Commands: string read into an array, just work through (iteration)
  # Stack (also an array, more pushing and popping)
  # Register: int

# Algo:
  # 1) Read in the commands, put in array
  # ? Pass register and stack?

def minilang(commands)
  commands = commands.split
  register = 0
  stack = []
  
  valid_commands = %w(PRINT PUSH ADD SUB MULT DIV MOD POP)

  commands.each do |command|
    if command.to_i.to_s != command &&
      valid_commands.include?(command) == false
      puts "Invalid command. Terminating."
      return "Error"
    end

    case command
    when "PRINT"
      mini_print(register)
    when "PUSH"
      stack << register
    when "ADD"
      register = register + stack.pop
    when "SUB"
      register = register - stack.pop
    when "MULT"
      register = register * stack.pop
    when "DIV"
      register = register / stack.pop
    when "MOD"
      register = register % stack.pop
    when "POP"
      register = stack.pop
    else # for n (ints)
      register = command.to_i
    end
  end

  return nil
end

def mini_print(register)
  puts register
end

# p minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# p minilang('3 PUSH 4 H 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')

# Word to Digit
# String input, find any *sequence* of written digits, convert to digits
  # Output: return same string but with digits converted
  # Sequence is 3 or more

# Examples: digits keep spaces between
# Data Structures: string in, array of word to find sequence, then hash to 
  # connect word to digit
  # (can I use a range to overlay?)

# Algorithm: convert string to array
  # 2) Locate sequence **
    # 1) check for downcased version of hash values
    # 2) if found, check others with array[i..i+sequence_min_length].all? {|w| }
     # a) That finds SEQUENCE length, but I want all in a sequence
      # aa) Convert that one element ** then check for previously converted
     # -> if SEQUENCE length found and converted, check previous element;
     # digit? then convert 
  # 3) replace words with digits in sequence ** (hash)
    # 
    # if WORD_TO_DIGIT.keys.include? word, convert
  # 4) Array to string
  # 5) Return

SEQUENCE_MIN_LENGTH = 3
WORDS_TO_DIGITS = { 
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
  "zero" => "0"
}

def word_to_digit(phrase)
  words = phrase.split
  phrase_array_with_digits = []

  words.each_with_index do |word, idx| 
    # binding.pry
    if word_is_digit?(word) && ( find_sequence?(words, idx) || 
                                word_is_digit?(words[idx-1]) )
      puts "found sequence"
      phrase_array_with_digits << convert_word_to_digit(word)
    else
      phrase_array_with_digits << word
    end
  end
  phrase_array_with_digits.join(" ")
end

def word_is_digit?(word)
  word = word.downcase.gsub(/[^a-z]/,"")
  return true if WORDS_TO_DIGITS.keys.include?(word)
  false
end

def convert_word_to_digit(word)
  word_no_punctuation = word.downcase.gsub(/[^a-z]/,"")
  just_punctuation = word[word_no_punctuation.length..-1]
  return "#{WORDS_TO_DIGITS[word_no_punctuation]}#{just_punctuation}"
end

def find_sequence?(words, idx)
  if words[idx..idx+SEQUENCE_MIN_LENGTH].all? { |word| word_is_digit?(word) } &&
                                    idx + SEQUENCE_MIN_LENGTH <= words.length
    return true
  else 
    return false
  end
end


# word_to_digit("One. Two. Three. Four.")

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Fibonacci Numbers (Recursion)
# Looking for the `nth` Fib number, where `n` is an argument to the method

# Recursion calls itself, has a stop condition, and uses its own return

# def fibonacci(nth_fib)
  
#   return 1 if nth_fib == 1 || nth_fib == 2
  
#   fibonacci(nth_fib - 1) + fibonacci(nth_fib - 2)

# end

# p fibonacci(12)

# Fibonacci Numbers (Procedural)
# Non-recursive.

# def my_fib(number)
  # return 1 if number <= 2
  # a = 1
  # b = 1
  # c = 1
  # (number-2).times do |i|
  #   c = a + b
  #   a, b = b, c 
  # end
  # c
#end

def fibonacci(number)
  first, last = 1, 1

  3.upto(number) do
    first, last = last, first + last
  end

last
end

# Fibonacci Numbers (Last Digit)

def fibonacci_last(number)
  first, last = 1, 1

  3.upto(number) do
    first, last = last, (first + last) % 10 
  end

last.to_s[-1].to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4