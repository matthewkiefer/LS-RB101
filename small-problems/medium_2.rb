# medium_2.rb

# Longest Sentence
def longest_sentence(text_file)
  page = File.open(text_file)
  page_data = page.read
  
  page_data.gsub!("\n", " ")
  
  sentences = page_data.split(/\.|\?|!/)
  
  # an array of sentences. Which sentence is longest? Look at each element, 
    # ...find out how many words in the sentence
      # -> sentence.split.count
  longest_sentence = sentences.reduce() { |longest, sentence| sentence.split.count > longest.split.count ? sentence : longest}
  puts longest_sentence
  puts longest_sentence.split.count
end

# longest_sentence("text.txt")
# longest_sentence("frankenstein.txt")

# Now I Know My ABCs
# Problem: 
  # Input: a string, one word
  # Output: true or false, based on certain criteria
  # Given pairs of letters, if one letter appears in the string, the other cannot
    # -> (returns false if both are in string)
    # Assume true unless pair found

# Examples: case doesn't matter
  # Single words
  # Doesn't matter if matching characters are next to one another

# Algo: hash, run through each characters, if it matches in the hash then false
# Or, regex, pairs in an array, match array0 and array1

BLOCKS = [ 
          ["B", "O"], ["K", "X"], ["C", "P"], ["N", "A"], ["G", "T"],
          ["R", "E"], ["F", "S"], ["J", "W"], ["H", "U"], ["V", "I"],
          ["L", "Y"], ["Z", "M"]
]

def block_word?(word)
  BLOCKS.each do |letter_pair|
    # puts "matched #{word} with #{letter_pair[0]} and #{letter_pair[1]} " if word.upcase.match?(letter_pair[0], letter_pair[1])
    return false if word.include?(letter_pair[0]) && word.include?(letter_pair[1])
  end
  true
end

# p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true

# Lettercase Percentage Ratio

# Notes off the bat: percent, .count, regex for letters, else for characters

# Problem: Given a string with uppercase, lowercase letters and characters that are neither,
# separate the three types, find the percent of each of the total, and then put that 
# info in a hash

# Input: string
# Return: hash with three entries: "uppercase:" => int, lowercase, and neither
# Output: none

# Examples: spaces are counted as neither. So are ints. Float in division.

# Data Structures: Input string, hash with three key/value pairs, consts with upper and lowercase letters
  # Holding variables for the *count* of the types

# Algorithm: examine each character of the string (aka array), and see if the arrays of letters include it
# If so, increment the correct type count
# Math the type counts to get percentages, then put in the hash
# Return the the hash

UPPERCASE_LETTERS = ("A".."Z").to_a
LOWERCASE_LETTERS = ("a".."z").to_a

def letter_percentages(str)
  percentages = {}
  uppercase_count = 0
  lowercase_count = 0
  neither_count = 0
  
  str.chars.each do |char|
    if UPPERCASE_LETTERS.include?(char)
      uppercase_count += 1
    elsif LOWERCASE_LETTERS.include?(char)
      lowercase_count += 1
    else
      neither_count += 1
    end
  end

  puts uppercase_count, lowercase_count, neither_count

  
  # float, division; also tell chelsea about the nil

  calculate_percentages(percentages, lowercase_count, uppercase_count, neither_count)
  percentages
end

def calculate_percentages(percentages, lowercases, uppercases, neither)
  
  total_count = uppercases + lowercases + neither.to_f
  percentages[:lowercase] = format("%.2f", lowercases / total_count * 100).to_f
  percentages[:uppercase] = format("%.2f", uppercases / total_count * 100).to_f
  percentages[:neither] = format("%.2f", neither / total_count * 100).to_f

end

# puts letter_percentages('abcdefGHI')

# Matching Parentheses?

# Problem: Within an argument string, check to see if the number of '(' = ')'
  # and left opens and right closes
  # and return true if so, false otherwise

  # return true or false

# Examples: 0 parentheses == true

# Data structures: string, bool (return value), array so we can inspect the chars

# Algo: count up from 0 for every left, down for right, never go below 0
  # We want to end up at 0 on our p_balance. Up 1 for every L parenthesis, 
  # down one for every right parenthesis, check every time we subtract one -
    # if we go below 0, return false

# Multiple methods?

def balanced?(str)
  p_balance = 0
  str.chars.each do |char|
  
    if char == "("
      p_balance += 1
    elsif char == ")"
      p_balance -= 1 
      return false if p_balance < 0
    end

  end
 
  return false if p_balance != 0
  true 

end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

# Triangle Sides

# Problem
  # Input: three numbers as lengths of sides of a triangle
  # Output: none
  # Return: symbol describing the type of triangle

# Examples: numbers can be floats; 0 or less is invalid

# Data structures: array of side lengths, numbers, math + if statements
  # Implication of hash with symbol?

# Algorithm:
  # numbers into array
  # Sort the numbers
  # Four cases. 
    # invalid: <= 0 or sides 1 + 2 < 3
    # scalene: a != b != c
    # equilateral? a = b = c
    # else isosceles

    # Return appropriate symbol

def triangle(a, b, c)
  sides = [a, b, c].sort

  if ( sides.any? { |side| side <= 0 } ) || ( sides[0] + sides[1] <= sides[2] )
  # if ( sides[0] <= 0 ) || ( sides[0] + sides[1] <= sides[2] )
    :invalid
  elsif a == b && b == c
    :equilateral
  elsif a != b && b != c && a != c
    :scalene
  else
    :isosceles
  end

end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

# # categorize triangle by number of different sides
# TRIANGLES = {
#     1 => :equilateral ,
#     2 => :isosceles,
#     3 => :scalene
# }

# def valid_triangle?(x, y, z)
#     [x,y,z].sort[0..1].sum > [x,y,z].sort.last
# end

# def triangles(x, y, z)
#     valid_triangle?(x, y, z) ? TRIANGLES[ [x, y, z].uniq.size ] : :invalid
# end

# p triangles(3, 3, 3) == :equilateral
# p triangles(3, 3, 1.5) == :isosceles
# p triangles(3, 4, 5) == :scalene
# p triangles(0, -1, 0) == :invalid
# p triangles(3, 1, 1) == :invalid

# Tri-Angles

# Problem: given three ints, return the triangle type as symbol depending on
#   the angles.
# Input: 3 ints
# Output: none
# Return: Symbol

# Data Structures: array

# Algorithm:
  # Acute: all angles < 90
  # Right: one angle = 90
  # Obtuse: One > 90

  # .sort.last -> largest angle
  # verify: no 0s, total = 180 (.sum)

# def triangle(ang_1, ang_2, ang_3)
#   angles = [ang_1, ang_2, ang_3]

#   return :invalid if angles.sum != 180 || angles.any?(0)
  
#   case angles.max
#   when 1...90
#     :acute
#   when 90
#     :right
#   when 91...180
#     :obtuse
#   end
# end

# # p triangle(60, 70, 50) == :acute
# # p triangle(30, 90, 60) == :right
# # p triangle(120, 50, 10) == :obtuse
# # p triangle(0, 90, 90) == :invalid
# # p triangle(50, 50, 50) == :invalid

# Unlucky Days
# Problem: Find the number of Friday the 13ths in a given year
  # Subproblems: Input and contain a calendar of days and day names

  # Find the total count of days to 1/1/given_year from 1753
    # Leap years
    # -> Start at 1753, add days, modulo will give us Day of the Week 
    #   and also, with leap year calcs, day of the month

# Examples: date given, integer returned

# Data structures. Keeping track of months etc, not necessary; need
#   month lengths (hash or array), year lengths (same?)
  # Basic unit is days
  # Need day of the week!
  #=> Array, [0] = Monday

# Algorithm
  # If I count am in 1753, then: 
  #  - I find which days are in this year. In this case day 1..day 365
    # Adding the days of all the other years, which needs leap years 
      # find_days_from_1753; return number of days
        # count_leap_years:
          # How many are divisible by 4, not 100, unless 400?
            # --? do I count the current year?

  # Point of all of this: find out whether the given year is a leap year
  #   and ***what day of the week Jan 1 is
    # So the counting is all about day of the week for the given year

  #  - I find which days are Fridays and put these days in an array

    # Which days are Fridays? Array of arrays of the year with ranges
    # ...

  #  - I find which days are the 13th of each month, put these in an array
  #  => then merge the arrays. | or merge..?

  # => what day of the week was 1/1/1753? Monday
  # Count days since 1753

  # Once I have the target days, I count them. (Count the merge of the arrays).
  # Return this count.

  # 1753, Jan 1 = monday, 1754, Jan 1 = Tuesday
    # ( current_year - start_year ) % 7 = array with Monday at 0
    #   add leap years total to that number

def count_leap_years(current_year, since_year = 1753)
  leap_years = 0
  (since_year...current_year).each do |year|
    leap_years += 1 if leap_year?(year)
  end
  leap_years
end

def leap_year?(year)
  if year % 4 == 0
    
    if year % 100 == 0
      return false unless year % 400 == 0
    end
    
    return true
  end
  
  false
end

def count_days_to(current_year, from_year = 1753)
  days_no_leap =  (current_year - (from_year - 1) )  * 365
  days = days_no_leap + count_leap_years(current_year)
end

def which_weekday(year, start_year = 1753)

  weekdays = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  day_number = ( (year - start_year) + count_leap_years(year)) % 7

  weekdays[day_number]
end

def weekday_index(year, start_year = 1753)

  # weekdays = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
  day_number = ( (year - start_year) + count_leap_years(year)) % 7

  day_number = (day_number + 1) % 7
end


def find_fridays(year)

  days = leap_year?(year) ? 366 : 365

  # insert an extra day if leap year
  # start_day = which_weekday(year)
  start_day_index = weekday_index(year)
  weekdays = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

  # start_weekday = weekdays[start_day]

  arr_of_fridays = []
  i = 1
  while i <= days
    arr_of_fridays << i if (i + start_day_index + 1) % 7 == 0
    i += 1
  end

  arr_of_fridays

  # fridays = days.select do |month|
  #   month.select do |day|
  #     start_day_index + 
  #   end
  # end

  # jan_1 =

          #=> so looking for [index of weekday of Jan 1] + (current day - 1) % 7 = 5
end

def find_thirteenths(year)
  calendar = [
    (1..31).to_a,
    (1..28).to_a,
    (1..31).to_a,
    (1..30).to_a,
    (1..31).to_a,
    (1..30).to_a,
    (1..31).to_a,
    (1..31).to_a,
    (1..30).to_a,
    (1..31).to_a,
    (1..30).to_a,
    (1..31).to_a
  ]
  calendar[1].push(29) if leap_year?(year)

  thirteenths = []
  calendar.flatten.each_with_index do |day, idx|
    thirteenths << idx + 1 if day == 13
  end
  thirteenths
end

  # start on a Monday, [1], mod of Mondays is 7
  # so we want [5]

  # looking for (Sunday =) 0 % 7 = 5
  # looking for day of the week % 7 = 5
  # if we start on a monday, day 5 is a Friday, so is day 12

  # Further simplification: 
    # If I start Jan 1 on a Wednesday, what's Jan 12?
      #  days later, Wednesday is spot 3, so ( spot + (current day - start) ) % 7 is [day]
      # looking for day = Friday, so day = [5]
        #=> so looking for [index of day of Jan 1] + (current day - 1) % 7 = 5



# def which_weekday(year) # Old and confusing
#   # Array of Sunday on [0] aligns with 1753 starting with Monday
#   weekdays = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
#   start_day_of_year = weekdays[count_days_to(year)find_fridays

# p find_fridays(2021)
# p find_fridays(1754)

p find_fridays(2020)
p find_thirteenths(2020)

p find_fridays(2020).count { |friday| find_thirteenths(2020).include?(friday) }

def friday_13th(year)
  find_fridays(year).count { |friday| find_thirteenths(year).include?(friday) }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2