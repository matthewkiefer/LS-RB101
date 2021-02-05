# easy_9.rb

# Welcome Stranger
# Problem: combine a given array (that forms a name when spaces added) and a hash of title and occupation
  # and return a greeting that mentions everything
  # => turn the name into a full name and put it in a string with the title occupation
# Examples:
# Data structures: accessing the name array, string; accessing hash by keys (:title and :occupation)
# Algo: name variable that is a joined name array with spaces 
  # string with interpolated name and accessed hash info

def greetings(name_arr, info_hsh)
  name = name_arr.join(" ")
  "=> Greetings, #{info_hsh[:title]} #{name}! I can see that you are a mighty fine #{info_hsh[:occupation]}."
end

# p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# Double Doubles
# ID double numbers; exclude them from the operation performed
# ID: make array, rotate
  # also check even

def twice(number)
  num_chars = number.to_s.chars
  if num_chars.size.even? && num_chars.rotate(num_chars.size / 2) == num_chars
    number
  else 
    number * 2
  end
end

# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# Always Return Negative
def negative(number)
  -(number.abs)
end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0 

# # Counting Up

# def sequence(int)
#   output_array = []
#   if int == 0
#     output_array << 0 
#   elsif int > 0
#     1.upto(int) do |i|
#       output_array << i
#     end
#   else 
#     int.upto(1) do |i|
#       output_array << i
#     end
#   end
#   output_array
# end

# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]
# p sequence(-5)
# p sequence(0)

# Uppercase Check
# Return true if no lowercase letters

def uppercase?(str)
  (str =~ /[a-z]/) == nil
end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# How Long Are You?
# In: string
# Out: Array (return)
          # every word from the string
                                      # space, then word length (number of chars)

def word_lengths(phrase)
  words_array = phrase.split
  words_array.map do |word|
    word = "#{word} #{word.size}"
  end
end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# p word_lengths("") == []

# Name Swapping
def swap_name(first_last)
  first, last = first_last.split
  "#{last}, #{first}"
end

# Sequence Count
=begin
In: two ints
          count, 0 or greater ; this many elements returned
          first number of sequence
Out: Array (return)
          Count number of elements
          Values of each element: start with start_num, then multiply by 2, 3, 4. etc (count # times)
Data Structures: array, some sort of range or loop
=end
def sequence(count, start_num)
  output_arr = [start_num] * count # populate with count, then just multiply
  output_arr.map.with_index do |num, idx|
    num * (idx + 1)
  end
end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# Grade Book
# Two parts: determine mean of three passed values between 0 and 100
# then find the case that mean fits in.
# Return letter value associated

def get_grade(grade_1, grade_2, grade_3)
  score = (grade_1 + grade_2 + grade_3) / 3.0

  case 
  when 90 <= score && score <= 100  
    "A"
  when 80 <= score && score < 90	 
    'B'
  when 70 <= score && score < 80	 
    'C'
  when 60 <= score && score < 70	 
    'D'
  when 0 <= score && score < 60	 
    'F'
  end
end

# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# Grocery List
def buy_fruit(deep_list)
  list = []
  deep_list.each do |fruits|
    fruits[1].times do
      list << fruits[0]
    end
  end
  list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]