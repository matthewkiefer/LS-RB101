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

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })