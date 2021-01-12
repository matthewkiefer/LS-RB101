VALID_CHOICES = %w(rock paper scissors)

def win?(first, second)
  (first == "rock" && second == "scissors") ||
    (first == "scissors" && second == "paper") ||
    (first == "paper" && second == "rock")
end

def display_results(player, computer)
  if player == computer
    prompt "TIE!!!"
  elsif win?(player, computer)
    prompt "Player wins!"
  else
    prompt "Computer wins!"
  end
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
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
  break unless answer.downcase.start_with? "y"
end

prompt "Good game"
