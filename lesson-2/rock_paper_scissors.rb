VALID_CHOICES = ["rock", "paper", "scissors"]

def prompt(message)
  puts "=> #{message}"
end

def display_results(p, c)
  if p == c
    prompt "TIE!!!"
  elsif (p == "rock" && c == "scissors") ||
        (p == "scissors" && c == "paper") ||
        (p == "paper" && c == "rock")
    prompt "Player wins!"
  else 
    prompt "Computer wins!"
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(", ")}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("Not a valid choice, sorry.")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt "You chose #{choice} and the computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt "Play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?"y"
end

prompt "Good game"
