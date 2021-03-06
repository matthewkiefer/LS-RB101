# tictactoe.rb
require "pry"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diaganals
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
VICTORIES_TO_WIN = 3
WHO_STARTS = "choose"

# rubocop:disable Metrics/AbcSize
def display_board(brd, system_command = "clear")
  system(system_command)
  puts ""
  puts "               |     |"
  puts "            #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "               |     |"
  puts "          -----+-----+-----"
  puts "               |     |"
  puts "            #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "               |     |"
  puts "          -----+-----+-----"
  puts "               |     |"
  puts "            #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "               |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, punc = ", ", separator = "or")
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

def display_greeting_and_rules
  system("clear")
  prompt "Welcome to Tic-Tac-Toe!"
  prompt "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  prompt "The board position choices are accessed by numbers as shown:"

  board_with_numbers = {}
  (1..9).each { |num| board_with_numbers[num] = num }
  display_board(board_with_numbers, "")
end

def initialize_board
  new_board = Hash.new(0)
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def wipe_board(brd)
  (1..9).each { |num| brd[num] = INITIAL_MARKER }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def announce_open_squares(brd)
  if empty_squares(brd).size == 1
    prompt "Square #{empty_squares(brd)[0]} is open."
  else
    prompt "Squares #{joinor(empty_squares(brd), ', ', 'and')} are open."
  end
end

def player_places_piece!(brd)
  square = ""

  loop do
    announce_open_squares(brd)
    print "=> Choose your move: "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = if poised_to_win(brd, COMPUTER_MARKER) # return a square or nil
             poised_to_win(brd, COMPUTER_MARKER)
           elsif poised_to_win(brd, PLAYER_MARKER)
             poised_to_win(brd, PLAYER_MARKER)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def poised_to_win(brd, which_marker)
  WINNING_LINES.each_with_index do |line, idx|
    player_in_a_row = brd.values_at(*line).count(which_marker)
    empty_space = brd.values_at(*line).index(INITIAL_MARKER)
    if player_in_a_row == 2 && empty_space
      return WINNING_LINES[idx][empty_space]
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
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
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
  brd[:player_score] = 0
  brd[:computer_score] = 0
end

def select_first_player
  first_player = "player"
  prompt "Who starts, player (p) or computer (c)? Player is default."
  selection = gets.chomp
  if selection.downcase == "c"
    first_player = "computer"
  end
  first_player
end

def place_piece!(board, current_player)
  if current_player == "computer"
    computer_places_piece!(board)
  else
    player_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == "computer" ? "player" : "computer"
end

####### Main Logic Here #######

display_greeting_and_rules
board = initialize_board
loop do
  current_player = if WHO_STARTS == "choose"
                     select_first_player
                   else
                     WHO_STARTS
                   end
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    increment_score(board)
    prompt "#{detect_winner(board)} won!"
    prompt "The score is now player: #{board[:player_score]}," \
           " computer: #{board[:computer_score]}"
  else
    prompt "It's a tie!"
  end

  if grand_winner?(board)
    prompt "#{detect_winner(board)} reached the score of #{VICTORIES_TO_WIN}" \
           " and is the GRAND WINNER!"
    reset_score(board)
  end

  prompt "Play again? Yes (y) or no (n), default yes."
  answer = gets.chomp
  break if answer.downcase.start_with?("n")
  wipe_board(board)
end

prompt "Thanks for playing. Bye now!"
