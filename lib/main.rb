# frozen_string_literal: true

require_relative "game"
require_relative "fen"
require_relative "save_game"

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
    SaveGame.load
  when 3
    board = Fen.confirm
    start_game(player_count, board)
  end
end

def start_game(players, board = nil)
  return Game.new(players).start if board.nil?

  Game.new(players, Board.new(board)).start
end

def player_count
  print "\n\nWhat kind of game do you want to play?\n\n\n"
  sleep(0.6)
  print "1: single player\n2: multiplayer\n3: simulate game\n\n>> "
  player_input
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
