# easy-4.rb

=begin
# Short Long Short
def short_long_short(str1, str2)
  if str1.size > str2.size
    short = str2
    long = str1
  else
    short = str1
    long = str2
  end
  short + long + short
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# What Century is That?
# Input: year (number)
# Output: 
# Return: string of the century
# Examples: "20th"
# Explicit req's: not just four digit years
# Implicit req's
  # Exceptions: 11th, 12th, 13th
# Data structures: hash for final digit (no)
# Algo: Search for exceptions, then hash, else "rd"

def century(year)
  final_number = {
    "0" => "th",
    "1" => "st",
    "2" => "nd",
    "4" => "th"
  }

  exceptions = ["11", "12", "13"]
  
  century = ((year.to_i + 99 ) / 100).to_s
  
  if exceptions.include?(century.slice(-2, 2))
    century + "th"
  elsif final_number.key?(century.chars.last)
    century + final_number[century.chars.last]
  else 
    century + "rd"
  end
end

century(2001) == '21st'
century(1965) == '20th'
century(2000) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

# Leap Years (Part 1)
# Input: any year greater than 0; string of int > 0
# Return: bool, true if leap year else false
# Output: none
# Examples: years range from 1 to 240000
# Explicit Reqs: leap years: evenly divisble by 4, unless also divisble by 100, except when 
  # also divisible by 400
# Implicit Reqs
# Data Structures: string input, converted to int

# Algo: Convert string to int. Check three nested ifs, return explicit, with false return at the end (after next if)

def leap_year?(year)
  year = year.to_i

  if (year % 4 == 0)
    if (year % 100 == 0)
      if (year % 400 == 0)
        return true
      end

      return false
    end
    
    return true
  end

  return false
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# Leap Years (Part 2)
# Updated req's: before 1752, leap years are every year divisible by 4
# Algo: if year / 4, 

def leap_year?(year)
  year % 4 == 0 && ( (year % 100 != 0 || year % 400 == 0) || year < 1752 )
end

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

# Multiples of 3 and 5
# Input: int > 1 (as string)
# Output: none
# Return: value computed (int)
# Explicit req's: 
# Implicit req's:
# Examples
# Data Structures: ranges, int, string, array
# Algorithm: Search range of 1..input number for 3 % 0 and then for 5 % 0; put in an array
  # Sum array
  # Return

# def multisum(int)
#   int = int.to_i
#   search_range = (1..int)
#   multiples = []

#   for multiple in search_range 
#     multiples << multiple if multiple % 3 == 0
#     multiples << multiple if (multiple % 5 == 0 && multiple % 3 != 0) # catch duplicates
#   end
  
#   multiples.sum 
# end

# Inject solution
# Algo: Turn range into an array, 
  # Inject element into sum if multiple

def multisum(number)
  possible_multiples = 1.upto(number)
  
  sum = possible_multiples.inject(0) do |sum, multiple| 
    (multiple % 3 == 0 || multiple % 5 == 0) ? sum + multiple : sum 
  end

end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

# Running Totals
# Problem:
  # Explicit req's: 
  # Implicit req's: Integers, empty returns empty, 1st always same
  # Input: Array of numbers
  # Output: 
    # Return: Array with same number of elements, "running total"
# Examples: **
# Data Structures: Array in, array built
# Algo: Map or inject? (Map with index?)
  # **WRONG** Or loop: copy [0], for 1 to size - 1 add i to i - 1
  # With map.with_index; assuming my if statement will return the orig, but it'll actually be nil
  # => example of fuzzy thinking

# def running_total(arr)
#   totaled = []

#   totaled = arr.map.with_index do |number, idx|
#     if idx == 0
#       number
#     else 
#       number = arr[0..idx].sum
#     end
#   end
  
#   p totaled
# end

def running_total(arr)
  arr.inject([]) do |arr, n| 
    p "Passed arr = #{arr}"
    p "Passed n = #{n}"  
    p (arr.last.to_i + n) 
    arr << (arr.last.to_i + n) 
  end
end

running_total([2, 5, 13])
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

# Convert a String to a Number!
# Problem
  # Explicit
  # Implicit
  # Input
  # Output 
    # Return: integer
    # Print
# Examples
# Data structures: input string of valid int
  # Conversion:
# Algos:
  # int_string size, each above one multiply by 10 working right to left
    # Loop size times

def string_to_integer(int_string)

  total_int = 0
  i = 1
  loop do
    int = ( string_char_to_int(int_string[-i]) * 10**(i-1) )
    total_int += int

    break if i == int_string.size
    i += 1
  end

  total_int
end

def string_char_to_int(char)
  case char
  when "0"
    0
  when "1"
    1
  when "2"
    2
  when "3"
    3
  when "4"
    4
  when "5"
    5
  when "6"
    6
  when "7"
    7
  when "8"
    8
  when "9"
    9
  end
end

# def string_to_signed_integer(signed_int)
#   if signed_int[0] == "+"
#     string_to_integer(signed_int.delete("+"))
#   elsif signed_int[0] == "-"
#     return_int = -(string_to_integer(signed_int.delete("-")))
#   else
#     string_to_integer(signed_int)
#   end

# end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

=end

# Convert a Number to a String!
# Problem:
  # Explicit:
  # Implicit:
  # Input: Integer, positive or 0
  # Output:
    # Return: String representation of integer
    # Print:
# Examples
# Data Structures: String, Int, conversion Hash
# Algorithm: read number one digit at at time, check hash, << into new string
  # - How do I look at one digit at a time?


DIGITS = {
  1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5",
  6 => "6", 7 => "7", 8 => "8", 9 => "9", 0 => "0"
}

def integer_to_string(int)
  str = ""

  loop do

    str.prepend(DIGITS[int.divmod(10)[1]])
  
    break if int.divmod(10)[0] == 0
    int = int / 10

  end
  str
end

def signed_integer_to_string(int)
  return "0" if int == 0
  
  int.positive? ? "+".concat(integer_to_string(int)) : "-".concat(integer_to_string(-int))
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'