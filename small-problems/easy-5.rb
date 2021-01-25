# easy-5.rb

# ASCII String Value
# Problem
  # Explicit
  # Implicit
# Input: string
# Output
  # Print
  # Return: int
# Notes: Method = ascii_value
# Data Structures: string, int, counter int
# Algo: Take the string, read each char separately and use .ord to get the number, then add the number to a counter
# and return the counter
  # - "one-character string" from the problem, so I'll use #each_char

def ascii_value(str)
  counter = 0
  str.each_char do |char|
    counter = counter + char.ord
  end
  counter
end

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

# After Midnight (Part 1)
# Problem
  # Explicit: The given int is the number of minutes after or before (negative) midnight; return "hh:mm" time.
  # Implicit: should continue to loop?. 
  # Examples: 0 returns "00:00". 0 in front for "02:30"
  # Input: Positive or negative integer
  # Output: 
  # Return: String of "hh:mm"
# Data Structures: Array of time (easy math with divmod), converted at the end

# Algorithm: divmod(60) should give hours, minutes. How to display two digit for 02:50? `#format`
  # 2.7.2 :001 > 90.divmod(60)
  #  => [1, 30]
  # 2.7.2 :002 > -90.divmod(60)
  #  => [-2, 30]
  # So negative time gets added to 24:00
    # Use %24 will give you correct time
  # Formatting: format("%02d", 14)
  # adding arrays: just manual

def time_of_day(minutes)
  time = [0, 0]
  hours_mins = minutes.divmod(60)
  # p hours_mins

  time[0] = hours_mins[0] % 24
  time[1] = hours_mins[1]

  p format_time(time)
end

def format_time(array)
  time_formatted = ""
  time_formatted << format("%02d", array[0]) + ":"
  time_formatted << format("%02d", array[1])
  time_formatted
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# After Midnight (Part 2)
# Problem: write a before_midnight and after_midnight method to take a a hh:mm time and turn it into an int of minutes
  # Explicit: 
  # Implicit: 
  # Examples: 24:00 == 0
  # Input: Positive or negative integer
  # Output: 
  # Return: int 0 <= 1439
# Data Structures: 
# Algo: 
  # After_midnight: use .to_i (hours) and .slice(-2, 2).to_i for ints, multiply first by 60

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours = time_str.to_i
  minutes = time_str.slice(-2, 2).to_i

  time = ( (hours * MINUTES_PER_HOUR) + minutes ) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  return 0 if time_str == ("24:00") || time_str == ("00:00")
  time = MINUTES_PER_DAY - (after_midnight(time_str))
end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# Letter Swap

def swap(sentence)
  sentence = sentence.split
  # split on " "
  # grab first letter, move last to first, move grabbed to last
  sentence.each do |word|
    first_char = word[0]
    word[0] = word[-1]
    word[-1] = first_char
  end

  sentence.join(" ")
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# Clean up the Words
# Algo: sub spaces for non-alphanumeric (use range and .includes), then sub " " for "  "

def cleanup(str)
  letters = ("a".."z")

  str = str.split("").map do |char|
    p char
    if letters.include?(char)
      char
    else 
      " "
    end
  end

  str = str.join

  str.squeeze!(" ")
end

# p cleanup("---what's my +*& line?") == ' what s my line '

# Letter Counter (Parts 1 and 2)
# Problem:
  # Input: String with one or more words separated by space
  # Output: 
  # Return: Hash of word lengths => number of *unique* occurances (include punctuation, separated by spaces)
  # Manipulations
  # Explicit req's
  # Implicit req's: no zeroes
# Examples
# Data Structures: String, hash of int => ints, array (intermediate step)
# Algorithm
=begin 
  input string
  create: final hash
  array of words (inc. punctuation, spaces gone)
  iterate through the array, for each element:
    if that element.size isn't a key in the hash, add it => 1
      if it is, increment that value
  return the hash

# Part 2: only letters
=end

ALPHABET = (a..z)

def word_sizes(sentence)
  count_hash = {}
  
  words = sentence.split
  p words
  words.each do |word|
    count_hash.has_key?(word.size) ? count_hash[word.size] += 1 : count_hash[word.size] = 1
  end 

  count_hash
end

def count_letters(word)
  word.reduce(0) do |size, w| 
    if ALPHABET.include?(w)
      size + 1
    else 
      size
    end
  end
end


p word_sizes('Four score and seven.') 
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

p count_letters("test")