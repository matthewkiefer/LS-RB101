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
   