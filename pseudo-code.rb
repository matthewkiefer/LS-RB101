# pseudo-code.rb

=begin
write out pseudo-code (both casual and formal) that does the following:

a method that returns the sum of two integers
casual:
collect two integers
add them to one another, result in a variable
return the variable

formal:
START
[assuming user input]
GET 1st integer into a variable
GET 2nd integer ""
SET 3rd variable = sum of 1st two
PRINT 3rd var
END

a method that takes an array of strings, and returns a string that is all those strings concatenated together
casual:
get the array
make a string to be returned
perform concatenation into the string
retunr string

formal:
START
Array is available, assume

SET string to be returned to ""

IF array has items, pop out and add to string

return string
END


a method that takes an array of integers, and returns a new array with every other element
casual:
iterate through the array, selecting every other element
push those elements into a new array
return the new array

formal:
START
int_arr assume available
SET new_array

WHILE iterator < int_arr length, 
  select every other (% 0?)
  move or copy selection to new_array

return new_array
END