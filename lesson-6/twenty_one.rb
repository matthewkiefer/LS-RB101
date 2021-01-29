# twenty_one.rb
require "pry"

SUITS = %w(Hearts Spades Clubs Diamonds)
RANK = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
VALUE = {} # lookup info on each card

INITIAL_HAND_SIZE = 2
PLAYER = "You"
COMPUTER = "Compy 386"

def initialize_cards
  SUITS.each do |suit|
    RANK.each_with_index do |rank, index|
      if rank == "Ace"
        VALUE["#{rank} of #{suit}"] = 11
      elsif index > 9
        VALUE["#{rank} of #{suit}"] = 10
      else
        VALUE["#{rank} of #{suit}"] = index + 1
      end
    end
  end
end

def prompt(message)
  puts "=> #{message}"
end

def display_diamonds
  puts <<-GRAPHIC
  /\\     /\\     /\\     /\\  
 /  \\   /  \\   /  \\   /  \\ 
/    \\ /    \\ /    \\ /    \\
\\    / \\    / \\    / \\    /
 \\  /   \\  /   \\  /   \\  / 
  \\/     \\/     \\/     \\/  
GRAPHIC
end

def initialize_deck
  VALUE.map { |name, _| name }
end

def deal_cards_from(deck, how_many)
  deck.pop(how_many)
end

def list_cards(hand)
  list = "the "
  case hand.size
  when 1
    list << hand[0]
  when 2
    list << "#{hand[0]} and the #{hand[1]}"
  when (3..20)
    # hand[] # need to fix "and"
    hand = hand.map { |c| "the #{c}" }
    hand[-1] = "and " + hand[-1]
    hand.join(", ")
  end
end

def value_of(hand)
  value = hand.reduce(0) do |total, card|
    total + VALUE[card]
  end

  reduce_aces_if_needed_and_return_value(value, hand)
end

def reduce_aces_as_needed_and_return_value(value, hand)
  if value > 21 && hand.to_s.include?("Ace")
    count_aces(hand).times do
      value -= 10 if value > 21
    end
  end
  value
end

def count_aces(hand)
  hand.to_s.scan(/Ace/).length
end

def bust?(hand)
  value_of(hand) > 21
end

def winner(player_hand, computer_hand)
  return PLAYER if value_of(player_hand) > value_of(computer_hand)
  COMPUTER
end

# loop

initialize_cards
loop do
  display_diamonds
  prompt "Welcome to Twenty-one! <="
  puts

  deck = initialize_deck
  deck.shuffle!

  player_hand = deal_cards_from(deck, INITIAL_HAND_SIZE)
  computer_hand = deal_cards_from(deck, INITIAL_HAND_SIZE)

  prompt "#{COMPUTER}'s up-facing card is the #{computer_hand[0]}."
  puts

  prompt "You're holding the #{list_cards(player_hand)}, " \
    "worth a total of #{value_of(player_hand)}."
  puts

  loop do # player hit loop
    hit_or_stay = ""

    loop do
      prompt "Hit (h) or stay (s)?"
      hit_or_stay = gets.chomp.downcase
      break if hit_or_stay == "h" || hit_or_stay == "s"
      prompt "Gotta make a valid choice here, buddy!"
    end

    if hit_or_stay == "h"
      player_hand += deal_cards_from(deck, 1)
      prompt "You've been dealt the #{player_hand.last}"
      prompt "You're now holding the #{list_cards(player_hand)}, " \
        "worth a total of #{value_of(player_hand)}."
    end

    break if hit_or_stay == "s" || bust?(player_hand)
  end # end of player hit loop

  # comp play in an `if`
  if !bust?(player_hand)
    # computer hit loop
    while value_of(computer_hand) < 17
      computer_hand += deal_cards_from(deck, 1)
      prompt "#{COMPUTER} hits: #{computer_hand.last}"
    end # end of computer hit loop

    if !bust?(computer_hand)
      prompt "#{COMPUTER} stays at #{value_of(computer_hand)}."
    end
  end
  # announce results

  if bust?(player_hand)
    prompt "\n\n#{PLAYER} busted with a hand value of #{value_of(player_hand)}!"
    # announce score, bust, ..break?
  elsif bust?(computer_hand)
    prompt "#{COMPUTER} busted with a hand value of #{value_of(computer_hand)}!"
  else
    prompt "The winner is #{winner(player_hand, computer_hand)}!"
  end

  # loop for play again
  response = ""
  loop do
    prompt "\n\nPlay another? Yes (y) or no (n)."
    response = gets.chomp.downcase
    break if response == "y" || response == "n"

    prompt "C'mon now, choose one or the other!"
  end

  break if response == "n"
end # of main (play again?) loop
prompt "Have a nice day now!"
