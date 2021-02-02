# twenty_one.rb
require "pry"

SUITS = %w(Hearts Spades Clubs Diamonds)
RANK = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
VALUE = {} # lookup info on each card

INITIAL_HAND_SIZE = 2
TARGET = 21
DEALER_HITS_UNTIL = 17
VICTORIES_TO_WIN = 3

PLAYER = "Player"
DEALER = "Compy 386"

SPADE = "\u2660"
HEART = "\u2665"
DIAMOND = "\u2666"
CLUB = "\u2663"

def initialize_cards
  SUITS.each do |suit|
    RANK.each_with_index do |rank, index|
      VALUE["#{rank} of #{suit}"] = if rank == "Ace"
                                      11
                                    elsif index > 9
                                      10
                                    else
                                      index + 1
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

def display_welcome
  display_diamonds
  prompt "Welcome to Twenty-one! <=\n\n"
end

def populate_deck
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
  else
    hand = hand.map { |c| "the #{c}" }
    hand[-1] = "and " + hand[-1]
    hand.join(", ")
  end
end

def announce_last_dealt_card(hand)
  card = hand.last
  suit = card.split.last 
  puts "\n" 

  print_decorated_card_dealt(card, suit)
end

def print_decorated_card_dealt(card, suit)
  announcement_length = "You've been dealt the #{card}".length

  case suit
  when "Hearts"
    puts "  " + "".center(announcement_length, "   #{HEART}")
    prompt "You've been dealt the #{card}"
    puts "  " + "".center(announcement_length, "   #{HEART}") + "\n\n"
  when "Clubs"
    puts "  " + "".center(announcement_length, "   #{CLUB}")
    prompt "You've been dealt the #{card}"
    puts "  " + "".center(announcement_length, "   #{CLUB}") + "\n\n"
  when "Spades"
    puts "  " + "".center(announcement_length, "   #{SPADE}")
    prompt "You've been dealt the #{card}"
    puts "  " + "".center(announcement_length, "   #{SPADE}") + "\n\n"
  when "Diamonds"
    puts "  " + "".center(announcement_length, "   #{DIAMOND}")
    prompt "You've been dealt the #{card}"
    puts "  " + "".center(announcement_length, "   #{DIAMOND}") + "\n\n"
  end
end

# def announce(suit)
#   puts 
# end

def value_of(hand)
  value = hand.reduce(0) do |total, card|
    total + VALUE[card]
  end

  reduce_aces_as_needed_and_return_value(value, hand)
end

def reduce_aces_as_needed_and_return_value(value, hand)
  if value > TARGET && hand.to_s.include?("Ace")
    count_aces(hand).times do
      value -= 10 if value > TARGET
    end
  end
  value
end

def count_aces(hand)
  hand.to_s.scan(/Ace/).length
end

def bust?(hand)
  value_of(hand) > TARGET
end

def winner(player_hand, dealer_hand)
  return PLAYER if value_of(player_hand) > value_of(dealer_hand)
  DEALER
end

def grand_victory?(p_vics, d_vics)
  p_vics == VICTORIES_TO_WIN || d_vics == VICTORIES_TO_WIN
end

def grand_victor(p_vics, d_vics)
  return PLAYER if p_vics == VICTORIES_TO_WIN
  DEALER
end

def increment_wins(who, p_wins = player_victories, d_wins = dealer_victories)
  who == DEALER

end

initialize_cards
player_victories = 0
dealer_victories = 0

# game loop
loop do
  display_welcome
  
  deck = populate_deck
  deck.shuffle!

  player_hand = deal_cards_from(deck, INITIAL_HAND_SIZE)
  dealer_hand = deal_cards_from(deck, INITIAL_HAND_SIZE)

  prompt "#{DEALER}'s up-facing card is the #{dealer_hand[0]}.\n\n"

  prompt "You're holding #{list_cards(player_hand)}, " \
    "worth a total of #{value_of(player_hand)}.\n\n"

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
      announce_last_dealt_card(player_hand)
      
      prompt "You're now holding #{list_cards(player_hand)}, " \
        "worth a total of #{value_of(player_hand)}.\n\n"
    end

    break if hit_or_stay == "s" || bust?(player_hand)
  end # end of player hit loop

  # comp play in an `if`
  if !bust?(player_hand)
    # dealer hit loop
    while value_of(dealer_hand) < DEALER_HITS_UNTIL
      dealer_hand += deal_cards_from(deck, 1)
      prompt "#{DEALER} hits: #{dealer_hand.last}"
    end # end of dealer hit loop

    if !bust?(dealer_hand)
      prompt "#{DEALER} stays at #{value_of(dealer_hand)},"\
        " holding the #{list_cards(dealer_hand)}. \n\n"
    end
  end
  # announce results

  # challenge to win tracking is that three conditions correlate to win: bust, bust, count
  if bust?(player_hand)
    prompt "#{PLAYER} busted with a hand value of #{value_of(player_hand)}!"
    dealer_victories += 1
  elsif bust?(dealer_hand)
    prompt "#{DEALER} busted with a hand value of #{value_of(dealer_hand)}!"
    player_victories += 1
  else
    winner = winner(player_hand, dealer_hand)
    prompt "The winner is #{winner}!"
    winner == PLAYER ? player_victories += 1 : dealer_victories += 1
  end

  if grand_victory?(player_victories, dealer_victories)
    prompt "The first to win #{VICTORIES_TO_WIN} games " \
      "is Grand Victor #{grand_victor(player_victories, dealer_victories)}!"
    player_victories = 0
    dealer_victories = 0
  else
    prompt "The score is #{PLAYER}: #{player_victories}, #{DEALER}: #{dealer_victories}."
  end

  # loop for play again
  response = ""
  loop do
    puts
    prompt "Play another? Yes (y) or no (n)."
    response = gets.chomp.downcase
    break if response == "y" || response == "n"

    prompt "C'mon now, choose one or the other!"
  end

  break if response == "n"
end # of main (play again?) loop
prompt "Have a nice day now!"
