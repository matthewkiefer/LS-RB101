# easy-1.rb

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', "suv"
]

def count_occurrences(array)
  occurances = {}
  array.each do |occurance|
    if occurances.key?(occurance.downcase)
      occurances[occurance.downcase] += 1
    else
      occurances[occurance.downcase] = 1
    end
  end

  occurances.each do |type, count|
    puts "#{type} => #{count}"
  end
end

count_occurrences(vehicles)

# Reverse It (Part 1)

def reverse_sentence(sentence)
  sentence = sentence.split
  sentence = sentence.reverse
  sentence.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Reverse It (Part 2)
def reverse_words(sentence)
  sentence = sentence.split
  sentence.map! do |word| 
    if word.length > 4
      word.reverse
    else 
      word
    end
  end
  
  sentence = sentence.join(" ")
end

puts reverse_words('Walk around the block')
puts reverse_words('Professional') 

# Stringy Strings
def stringy(int)
  count = 1
  stringies = "1"
  while count < int
    if stringies.size.odd? 
      stringies << "0"
    else 
      stringies << "1"
    end
    count += 1
  end
  stringies
end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Array Average
def average (array)
  array.sum / array.size
end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Sum of Digits
def sum(int)
  digits = int.to_s.split("").map(&:to_i)
  digits.sum
end

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# What's my Bonus?
def calculate_bonus(salary, success=true)
  success ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000