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

CARDS = {
  "Ace of hearts" => {value: 11, high: true}
}


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

CARDS = {
  "Ace of Hearts": 11,


}

=end

SUITS = %w(Hearts Spades Clubs Diamonds)
VALUES = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
CARD = {} #lookup info on each card

def initialize_cards
  SUITS.each do |suit|
    VALUES.each_with_index do |value, index|
      if value == "Ace"
        CARD["#{value} of #{suit}"] = 11
      elsif index > 9
        CARD["#{value} of #{suit}"] = 10
      else
        CARD["#{value} of #{suit}"] = index + 1
      end
    end
  end
end

def initialize_deck
  deck = CARD.map { |name, _| name }
end

# loop

initialize_cards
p initialize_deck



# def initialize_deck
#   new_deck = []
  
#   SUITS.each do |suit|
#     VALUES.each_with_index do |value, index|
#       new_deck.push("#{value} of #{suit}")
#       if index > 9
#         CARD["#{value} of #{suit}"] = { value: 10}
#       else
#         CARD["#{value} of #{suit}"] = { value: index + 1}
#         # binding.pry
#       end
#     end
#   end
#   # working on aces
#   CARD["ace of spades"][high: 11]
#   CARD["ace of hearts"][high: 11, low: 1]
#   CARD["ace of diamonds"][high: 11, low: 1]
#   CARD["ace of clubs"][high: 11, low: 1]

#   new_deck
# end

# deck = initialize_deck
# p CARD["eight of diamonds"]
# p CARD["jack of hearts"]


