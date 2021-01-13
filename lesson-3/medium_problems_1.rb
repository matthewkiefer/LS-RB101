# medium_problems_1.rb

# ASCII Art - solution 1 is two lines, not one
notice = "The Flintstones"
30.times { |i| puts notice.insert(0, " ") }

#recursion? 

#solution 2
30.times { |i| puts "The Flintstones".rjust(i+16) }

#solution 3 (from assignment; test)
30.times { |i| puts (" " * i) + "The Flintstones" }


# Question 3 - Factors
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def factors2(number)
  divisor = 1
  factors = []
  while number >= divisor
    factors << divisor if number % divisor == 0
    divisor += 1
  end
  factors
end

puts factors(24)
puts factors2(-2)