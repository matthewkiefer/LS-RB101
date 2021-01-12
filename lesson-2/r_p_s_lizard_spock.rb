# r_p_s_lizard_spock.rb

VALID_CHOICES = {
  "rock" => "r",
  "paper" => "p",
  "scissors" => "sc",
  "lizard" => "l",
  "spock" => "sp"
}
BEATS_HASH = {
  "rock" => ["lizard", "scissors"],
  "paper" => ["rock", "spock"],
  "scissors" => ["lizard", "paper"],
  "spock" => ["rock", "scissors"],
  "lizard" => ["paper", "spock"]
}
score = {
  "computer" => 0,
  "player" => 0,
  "tie" => 0
}
winner = ""

def increment_score(victor, current_score)
  current_score[victor] += 1
end

def display_score(score)
  prompt "The score is computer: #{score[computer]} to player: #{score[player]}"
end

def win?(first, second)
  BEATS_HASH[first].include?(second)
end

def calculate_results(first, second)
  if first == second
    "tie"
  elsif win?(first, second)
    puts "testing, first = #{first}"
    first
  else
    puts "testing, second = #{second}"
    second
  end
end


def display_results(winner)
  if winner == "tie"
    prompt "Tie!"
  else
    prompt "Winner is #{winner}!"
  end
end

def prompt(message)
  puts "=> #{message}"
end

def formatted_choices(choices_hash)
  flattened = choices_hash.inspect.gsub("=>", " or ")
  flattened.delete "{" "}"
end


loop do
  choice = ""
  loop do
    prompt("Choose one: #{formatted_choices(VALID_CHOICES)}")
    choice = gets.chomp
    
    if VALID_CHOICES.has_value?(choice)
      choice = VALID_CHOICES.key(choice)
    end

    if VALID_CHOICES.keys.include?(choice) 
      break
    else
      prompt("Not a valid choice, sorry.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample
  prompt "You chose #{choice} and the computer chose #{computer_choice}"

  winner = calculate_results(choice, computer_choice)
  display_results(score)
  increment_score(winner, score)

  prompt "Play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with? "y"
end

prompt "Good game"
