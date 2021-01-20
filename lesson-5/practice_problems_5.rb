# practice_problems_5.rb

# problem 1
arr = ['10', '11', '9', '7', '8']

# p arr.sort_by! { |element| -element.to_i } # one solution

arr[0].to_i.inspect

sorted = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p sorted

# problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted = books.sort_by do |book|
  book[:published]
end

p sorted
   
# problem 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3] == "g"

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0] == "g"

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0] == "g"

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1["b"][1] == "g"

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].keys[0] == "g"

# problem 4
arr1 = [1, [2, 3], 4]
arr1[2] = 3
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[["a"]][:a][2] = 4
p hsh2

# problem 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age = 0
total_age = munsters.each do |value, key|
    age += key["age"] if key["gender"] == "male"
end
puts age

  # munster.reduce do |age, munster["age"]|
  #   munster["age"]

# problem 6
munsters.each do |name, info|
  puts "#{name} is a #{info["age"]}-year-old #{info["gender"]}"
end

# problem 7
# arr = [4, [3, 8]]
# note to self: read the problem carefully!

# problem 8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = ""
hsh.each do |key, words|
  words.each do |word|
    word.chars.each do |char|
      if char =~ /[aeiou]/
        vowels << char
      end
    end
  end
end

puts vowels

# problem 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
new_arr = arr.clone
new_arr.each do |sub_arr|
  # if sub_arr[0] == "b" ||
  #   sub_arr[0] == 2
        sub_arr.sort! { |a, b| b <=> a }
  # else 


  # case sub_arr[0]
  # when sub_arr[0].to_i > 0
  #   puts "case a"
  #   sub_arr.sort! { |a, b| b <=> a }
  # when "b"
  #   puts "case b"
  # end
end
p new_arr

# problem 10
original_arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
new_arr = original_arr.map do |hsh|
  hash = hsh.dup
  hash.each do |k, v| 
    v += 1 
    hash[k] = v
  end

end
p original_arr
p new_arr

# problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |sub_arr|
  sub_arr.select do |digit|
    digit % 3 == 0
  end
end

p arr2

# problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

def hash_it(arr)
  hsh = {}
  arr.each do |element|
    hsh[element[0]] = element[1]
  end
  hsh
end

p hash_it(arr)

# problem 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

 p ( arr.sort do |a, b|
   a.select(&:odd?) <=> b.select(&:odd?)
 end )

# arr.sort_by do |element|
  
# problem 14
# input: hsh
# output: [return] array with veggie sizes up'cased and fruit colors capitalized

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# two levels of .each, << the info in after transforming it with .capitalize or .upcase methods
def produce_info(hsh)
  info_arr = []

  hsh.each_value do |description|

    if description[:type] == "fruit"
      color_arr = description[:colors].map { |color| color.capitalize }
      info_arr << color_arr
    end

    if description[:type] == "vegetable"
      info_arr << description[:size].upcase
    end

    # description.each do |characteristic, adjective|
    #   if adjective == "fruit"
    #     puts "found a fruit"
    #   end
    #   if characteristic == :colors
    #     color_arr = adjective.map { |color| color.capitalize }

    #     info_arr << color_arr
    #   end
    # end
  end 

  info_arr
end

p produce_info(hsh)

# problem 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# Selecting from among the first-level elements (hashes), so .select to start
# For second level, need to return true if all the values are even
# - .values will return an array; check that all array elements are even
# - - Some arrays are nested

def select_evens(arr)
  return arr.select do |hsh|
    hsh.values.flatten.all? { |v| v.even? }
  end
end

p select_evens(arr)

# problem 16
# looked for some sort of conversion; found i.to_s(base=10). To get the correct length, generating each digit singly.
def make_uuid()
  uuid = ""
  8.times { uuid << rand(16).to_s(16) }
  uuid << "-"
  3.times do
    4.times { uuid << rand(16).to_s(16) }
    uuid << "-"
  end
  12.times { uuid << rand(16).to_s(16) }
  
  uuid
end


p make_uuid


