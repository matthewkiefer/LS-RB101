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