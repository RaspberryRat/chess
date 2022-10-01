# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require_relative 'move'
require_relative 'available_moves'
require 'pry-byebug'


class Game

  attr_reader :board, :move, :move_list
  
  def initialize(board = Board.new, move = Move, move_list = AvailableMoves)
    @board = board
    @move = move
    @move_list = move_list
  end

  def start
    board.print_board
    loop do
      puts "Select the piece you would like to move (e.g., 'a4')"
      piece_selected = player_input
      break unless available_moves?(piece_selected)

      #TODO would like to somehow highlight available moves

      destination = player_input
      break if move_piece(piece_selected, destination)

      # TODO create new board state with piece moved
    end
    # need to do game check and restart move loop
    # TODO add players
  end

  def player_input
    loop do
      choice = gets.chomp
      return choice if verify_input(choice)

      puts "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
    end
  end

  def verify_input(input)
    return true if /^[a-h][1-8]$/.match(input)

    false
  end

  private

  def available_moves?(piece_selected)
    return true if move_list.possible_move(piece_selected, board.board)

    false
  end

  def move_piece(location, destination)
    return true if move.move_loop(location, destination, board.board)

    false
  end
end
