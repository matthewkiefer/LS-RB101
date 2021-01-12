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

def calculate_results(player, computer)
  if player == computer
    "tie"
  elsif win?(player, computer)
    "player"
  else
    "computer"
  end
end

def display_results(winner, passed_score)
  if winner == "tie"
    prompt "Tie!"
  else
    prompt "Winner is #{winner}!"
  end
  prompt "The score is player #{passed_score['player']} to computer #{passed_score['computer']}"
end

def winner_announce_and_reset(passed_score)
  if passed_score["player"] == 5
    prompt "Player is the first to five points: grand winner!"
    score_reset(passed_score)
  end
  if passed_score["computer"] == 5
    prompt "The computer is the first to five points: grand winner!"
    score_reset(passed_score)
  end
end

def score_reset(passed_score)
  passed_score["computer"] = 0
  passed_score["player"] = 0
  passed_score["tie"] = 0
  prompt "Resetting scores to zero."
end

def prompt(message)
  puts "=> #{message}"
end

def abbrev_to_full(choice)
  if VALID_CHOICES.value?(choice)
    VALID_CHOICES.key(choice)
  else choice
  end
end

def formatted_choices(choices_hash)
  flattened = choices_hash.inspect.gsub("=>", " or ")
  flattened.delete "{}"
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{formatted_choices(VALID_CHOICES)}")
    choice = gets.chomp
    choice = abbrev_to_full(choice)

    if VALID_CHOICES.keys.include?(choice)
      break
    else
      prompt("Not a valid choice, sorry.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample
  prompt "You chose #{choice} and the computer chose #{computer_choice}"

  winner = calculate_results(choice, computer_choice)

  increment_score(winner, score)
  display_results(winner, score)

  winner_announce_and_reset(score)

  prompt "Play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with? "y"
end

prompt "Good game"
