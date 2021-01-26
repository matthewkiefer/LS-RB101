# tictactoe.rb
require "pry"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diaganals
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
VICTORIES_TO_WIN = 3

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board(brd = Hash.new(0))
  new_board = brd
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  # reset_score_if_victor(new_board)
  new_board
end

def wipe_board(brd)
  (1..9).each { |num| brd[num] = INITIAL_MARKER }
end

def joinor(arr, punc = ",", separator = "or")
  case arr.size
  when 1 
    arr[0]
  when 2
    "#{arr[0]} #{separator} #{arr[1]}"
  else
    arr[-1] = "#{separator} #{arr[-1]}"
    arr.join(punc)
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ""
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  # binding.pry
  square = nil
  if find_win_opportunity(brd)
    square = find_win_opportunity(brd)
  elsif threatened_by(brd) # return a square or nil
    square = threatened_by(brd)
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def threatened_by(brd)
  WINNING_LINES.each_with_index do |line, idx|
  # WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2 &&
      brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 0
      #return whichever is still open
      # binding.pry
      return WINNING_LINES[idx][brd.values_at(line[0], line[1], line[2]).index(INITIAL_MARKER)]
    end
  end
  nil
end

def find_win_opportunity(brd)
  WINNING_LINES.each_with_index do |line, idx|
  # WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 2 &&
      brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 0
      #return whichever is still open
      # binding.pry
      return WINNING_LINES[idx][brd.values_at(line[0], line[1], line[2]).index(INITIAL_MARKER)]
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def grand_winner?(brd)
  brd[:player_score] == VICTORIES_TO_WIN ||
  brd[:computer_score] == VICTORIES_TO_WIN
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 # splat line; same below
      return "Player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def increment_score(brd)
  winner = detect_winner(brd)
  winner == "Player" ? brd[:player_score] += 1 : brd[:computer_score] += 1
end

def reset_score(brd)
  initialize_board
end

####### Main Logic Here #######

board = initialize_board
loop do

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    increment_score(board)
    prompt "#{detect_winner(board)} won!"
    # binding.pry
    prompt "The score is now player: #{board[:player_score]}, computer #{board[:computer_score]}"
  else
    prompt "It's a tie!"
  end

  if grand_winner?(board)
    prompt  "#{detect_winner(board)} reached the score of #{VICTORIES_TO_WIN}" +
            " and is the GRAND WINNER!"
    reset_score(board)
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
  wipe_board(board)
end

prompt "Thanks for playing. Bye now!"

# 
# 2. Keep score
# Playing to five. No instance or global variables.
# So, must pass the score each time.

# 1. Display the initial empty 3x3 board.
#   2.5 Display score up top
#   Can I add score to board?
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner and. 
#   If 5 times, grand winner
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# Initialize: pass the board to it (with a defualt param); check score def
#   -grand_winner?

#   on init, don't set score but don't reset
#   ----way to have the default value be 0 of a new hash key
#   Init sets the default value
#   win condition adds one
#   in someone_won? 

# added default values, but still need to pass the board back at the start to keep the hash from 
# being overwritten

# To improve on score keeping: announce goal at start