# frozen_string_literal: true
require 'pry-byebug'
require_relative 'main'
require_relative 'piece_module'
require_relative 'board_square'
include PieceVariables

# playing board for pieces
class Board
  attr_accessor :board

  def initialize(board = positions(build_board))
    @board = board
  end

  def build_board
    board_array = []
    (1..8).to_a.repeated_permutation(2) { | arr| board_array << arr }
    board_array
  end

  BoardLocations = Struct.new(:x_position, :y_position, :game_piece)
  def positions(location)
    location.map { |cell| BoardLocations.new(cell[0], cell[1], cell[2]) }
  end

  def print_board
    chess_board = ''
    # empty_green_space = BoardSqaure.new
    # empty_white_space = BoardSquare.new

    board.reverse.map do |position|
      square_color = BoardSquare.for(position.x_position, position.y_position, position.game_piece)
      # sets number to indicate row
      chess_board += "#{position.x_position} " if position.y_position == 8
      chess_board += square_color.to_s
      chess_board += NEW_LINE if position.y_position == 1
    end
    chess_board += "   A  B  C  D  E  F  G  H\n"
    print chess_board
  end
end

