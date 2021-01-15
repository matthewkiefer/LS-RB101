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
puts ages.values.sum