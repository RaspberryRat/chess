# frozen_string_literal: true

require_relative "game"
require_relative "fen"
# Game.new.start

# Game.new(
#   Board.new("rnbqkbnr/pppp1ppp/8/4p3/8/P7/1PPPPPPP/RNBQK1NR w KQkq")
# ).start

# Game.new(Board.new("8/8/8/8/2q5/2K5/8/8 w")).start

# Game.new(Board.new("8/8/8/8/2q5/7R/2K5/8 w")).start

# Game.new(Board.new("8/8/8/8/8/1q6/8/K7 w")).start

# Game.new(Board.new("8/8/8/8/2q5/8/8/K7 b")).start

#check mates
# Game.new(Board.new("8/4N1pk/8/8/8/7R/8/6K1 b")).start

# Game.new(Board.new("6kR/6P1/5K2/8/8/8/8/8 b")).start

# Game.new(Board.new("7k/7R/5N2/8/8/8/8/6K1 b")).start

# Game.new(Board.new("3R2k1/5ppp/8/8/8/8/5PPP/6K1 b")).start

# Game.new(Board.new("4K3/8/2b2q2/8/8/8/8/6k1 w")).start

# Game.new(Board.new("5rk1/7B/8/6N1/8/8/1B6/6K1 b")).start

# Game.new(Board.new("5rk1/6RR/8/8/8/8/8/6K1 b")).start

# Game.new(Board.new("7k/5N1p/8/8/8/8/8/2K3R1 b")).start

# Castling

# Game.new(Board.new("r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w")).start

# Game.new(Board.new("r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq")).start

# KQkq

# Game.new(Board.new("r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq")).start

#Promotion

# Game.new(Board.new("3k4/6P1/8/8/8/8/7p/3K4 w KQkq")).start

# Game.new(Board.new("8/8/8/8/6pP/8/8/K7 b h3")).start

# Game.new(
#   Board.new("rnbqkbnr/p1pp1pp1/8/1p2p3/3P2Pp/P6P/1PPKPP2/RNBQ2NR b kq g3")
# ).start

# Game.new(Board.new("qn2k3/8/8/RR5R/8/8/8/bK5B b KQkq")).start

def game_start
  welcome_message
  start_game(player_count) if new_game?
end

def new_game?
  puts "Do you want to start a new game?"
  print "1: new game\n2: load game from file\n3: start game with fen notation\n\n>> "

  choice = player_input

  case choice
  when 1
    true
  when 2
    false
  when 3
    board = load_by_fen
    start_game(player_count, board)
  end
end

def load_by_fen
  puts "Refer to the readme file for examples of fen notation..."
  puts "New game: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq'"
  print "Enter fen notation:\n>>"
  player_notation
end

def player_notation
  loop do
    player_fen = gets.chomp
    return player_fen if confirm_notation?(player_fen)
    puts "That notation is incorrect, refer to the readme..."
    print "Enter fen notation:\n>>"
  end
end

def confirm_notation?(player_fen)
  fen_array = player_fen.split(" ")
  fen_array[0] = fen_array[0].split("/")

  i = 0
  fen_array.flatten.each do |line|
    i += 1
    if i <= 8
      return false unless line.match(/^[rnbqkpRNBQKP1-8]{1,8}$/)
    elsif i == 9
      return false unless line == "w" || line == "b"
    elsif i == 10
      next if line.match(/^[KQkq]+$/) || line.match(/^([a-h][1-8]|-)$/)
      false
    elsif i == 11
      return false unless line.match(/^([a-h][1-8]|-)$/)
    end
  end
  true
end

def start_game(players, board = nil)
  return Game.new(players).start if board.nil?

  Game.new(players, Board.new(board)).start
end

def player_count
  print "\n\nDo you want to play 1 player or 2 player game?\n\n\n"
  sleep(0.6)
  print "1: single player\n2: multiplayer\n3: simulate game\n\n>> "
  player_input
end

def player_input_2
  loop do
    choice = gets.chomp.to_i
    return choice if (1..3).include?(choice)

    puts "You must enter 1, 2, or 3"
    print ">> "
  end
end

def player_input
  loop do
    choice = gets.chomp.to_i
    return choice if (1..3).include?(choice)

    puts "You must enter 1, 2, or 3"
    print ">> "
  end
end

def welcome_message
  system("clear") || system("cls")

  puts "welcome to...."
  sleep(1)
  message =
    '


    _____   _    _   ______    _____    _____
    / ____| | |  | | |  ____|  / ____|  / ____|
   | |      | |__| | | |__    | (___   | (___
   | |      |  __  | |  __|    \___ \   \___ \
   | |____  | |  | | | |____   ____) |  ____) |
    \_____| |_|  |_| |______| |_____/  |_____/




                                                          '
  puts message
end

game_start
