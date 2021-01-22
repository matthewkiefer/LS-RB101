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

=end

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