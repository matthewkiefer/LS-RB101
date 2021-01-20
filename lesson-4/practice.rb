# practice.rb

# loops

# selection and transformation
=begin
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


def select_fruit(produce)
  fruits = {}
  produce.each do |product, type|
    if type == "Fruit"
      fruits[product] = [type]
    end
  end
  fruits
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}


numbers = [4, 5, 6]

def double_numbers!(numbers)
  counter = 0
  
  loop do
    break if numbers.size == counter

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end
end

puts numbers

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

puts double_odd_numbers(numbers)


def multiply_by(numbers, multiplier)
  multiplied_numbers = []
  count = 0

  loop do
    break if count == numbers.size

    multiplied_numbers[count] = numbers[count] * multiplier

    count += 1
  end
  multiplied_numbers
end

numbers = [1, 2, 3, 4, 5]
puts multiply_by(numbers, 4)


flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flinthash = {} 

flintstones.each_with_index do |flintstone, i|
  flinthash[flintstone] = i
end

puts flinthash
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#puts ages.values.sum
#ages.delete_if { |munster, age| age > 100 }

puts ages.values.min

# Practice Problem 5

=begin
Problem: Return the index of the *First* name that starts with the string "Be"
..Algorithm: Look at each string, compare first two letters with .slice

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
index_sought = nil
count = 0

loop do
  if flintstones[count].slice(2) == "Be"
    index_sought = count
    break
  elsif count == flintstones.size - 1
    break
  end
  count += 1
end

puts index_sought

=end

# 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones = flintstones.map { |fli| fli = fli[0, 3] }

p flintstones

statement = "The Flintstones Rock"
no_spaces = statement.gsub(" ", "")
letter_hash = no_spaces.chars.each_with_object({}) do |char, hash|
  if hash.key?(char)
    hash[char] += 1
  else 
    hash[char] = 1
  end
end


p letter_hash

arr = [1, 2, 3, 4]
counter = 1

arr.each do |i|
  puts "this is time through number #{counter}"
  p "this is i and below is the first shift: #{i}"
  p arr.shift 
  p "this is the new i and below is p arr: #{i}"
  p arr
  counter += 1
end

# Titleize
words = "the flintstones rock"

def titleize(string)
  arr = string.split
  titleized = ""
  arr.each do |word|
    word[0] = word[0].upcase
    titleized << word + " "
  end
  titleized.chomp(" ")
end

p titleize(words)

#

munsters = {
  "Herman" => { "age" => 18, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# def munsters_upgrade(family_hash) 
#   family_hash.each do |who, munster|
#      puts munster["age"]
#     if munster["age"] < 18
#       munster["age_group"] = "kid" 
#     elsif munster["age"] < 65
#       munster["age_group"] = "adult" 
#     else
#       munster["age_group"] = "senior"
#     end
#   end
# end

# def munsters_upgrade(family_hash)
#   family_hash.each do |who, munster|
#     case munster["age"]
#     when 0..17
#       munster["age_group"] = "kid" 
#     when 18..65
#       munster["age_group"] = "adult" 
#     else
#       munster["age_group"] = "senior"
#     end
#   end
# end

# p munsters_upgrade(munsters)


=begin
in: 
- array
- even and odd
- integers
out: two arrays, `odd_numbers` and `even_numbers`
facts:

