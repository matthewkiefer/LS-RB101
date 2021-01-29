# twenty-one.rb
require "pry"

=begin
1. Initialize deck
Problem: Need 52-card deck, values 1-10 with ace 1 or 11, plus names, randomizable
  Implicit:
Input: 
Output:
Return:

Data Structures: Array of hashes, title/suit, numeric value, and a bool high for ace

**** Deck of cards PEDAC
Problem: 52 cards; each has a different name an point value
A deck is a list of all 52 of these, some can stay or go. Shuffle and pop points to array.




*********************************
Deck and hands are just arrays, with hash for reference
Trouble: aces
Solution: error checking (re-evalute with each card draw)

Algo:
  - array of values (use ace, 2-10, jack, queen, king)
  - array of suits
  method to combine + add value

  ace_of_hearts[:value] = 1

2c for 2 of clubs?



2. Deal cards to player and dealer

Problem: get two cards to player (visible) and dealer (first one visible, implied)
  - Ace: evaluate each time a new card is drawn
    - Need a function to check each ace and knock from 11 to 1 if bust
      - or, eval each ace as drawn
Data Structures: Each hand is an array of hashes

]

*****
Array of strings ("ace of clubs, etc."), hash lookup table
card["ace of hearts"] = { value: 11, high: true,  }

3. Player turn: hit or stay
  - repeat until bust or "stay"
  Algo: Loop
    - display current hand (and score)
    - ask: anohter?
    - if no, exit loop ("stay")
    - if yes, card from deck to hand.
      - if bust, display hand and announce
      - otherwise to top of loop
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
    while loop. Different loop from above, or same with whose_turn bool?
6. If dealer bust, player wins.
7. Compare cards and declare winner.

VALUES = {
  "Ace of Hearts": 11,


}


  /\     /\     /\     /\  
 /  \   /  \   /  \   /  \ 
/    \ /    \ /    \ /    \
\    / \    / \    / \    /
 \  /   \  /   \  /   \  / 
  \/     \/     \/     \/  

=end



SUITS = %w(Hearts Spades Clubs Diamonds)
RANK = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
VALUE = {} #lookup info on each card

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
  deck = VALUE.map { |name, _| name }
end

# def shuffle(deck)
#   deck.shuffle
# end

def deal_cards_from(deck, how_many)
  cards_dealt = deck.pop(how_many)
end

def reevaluate_ace(hand)
  # check for ace here or in main logic?
  # if an ace == 11, move it to 1 if the conditions need
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

  if value > 21 && hand.to_s.include?("Ace")
    # for each occurance of Ace, check over 21, and  subtract 10, up to max number of aces
    # times, until below 21
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
  value_of(hand) > 21 ? true : false
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

    # Algo: Loop
    # - display current hand (and score)
    # - ask: anohter?
    # - if no, exit loop ("stay")
    # - if yes, card from deck to hand.
    #   - if bust, display hand and announce
    #   - otherwise to top of loop
    
    # when to reduce ace, or change data structs? perhaps reduce at value_of call
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
    while value_of(computer_hand) < 17 # computer hit loop
      computer_hand += deal_cards_from(deck, 1)
      prompt "#{COMPUTER} hits: #{computer_hand.last}"
    end # end of computer hit loop
    
    if !bust?(computer_hand)
      prompt "#{COMPUTER} stays at #{value_of(computer_hand)}."
    end
  end
  # announce results
  

  if bust?(player_hand)
    prompt "#{PLAYER} busted with a hand value of #{value_of(player_hand)}!"
    # announce score, bust, ..break?
  elsif bust?(computer_hand)
    prompt "#{COMPUTER} busted with a hand value of #{value_of(computer_hand)}!"
  else 
    prompt "The winner is #{winner(player_hand, computer_hand)}!"
  end
  # Since bust is an if, everything afterwards must be general to bust and not bust, or an if


  # loop for play again
  response = ""
  loop do
    prompt "Play another? Yes (y) or no (n)."
    response = gets.chomp.downcase
    break if response == "y" || response == "n"

    prompt "C'mon now, choose one or the other!"  
  end

  break if response == "n"
  # end of play again logic
end # of main (play again?) loop
prompt "Have a nice day now!"