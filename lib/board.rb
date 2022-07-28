# frozen_string_literal: true

require 'pry-byebug'

require_relative 'piece_module'
require_relative 'board_square'
include PieceVariables

# playing board for pieces
class Board
  attr_accessor :board, :printed_board

  def initialize(board = positions(build_board), printed_board = nil)
    @board = board
    @printed_board = printed_board
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
    printed_board = ''

    board.reverse.map do |position|
      square_color = board_square(position)
      # sets number to indicate row
      printed_board += "#{position.x_position} " if position.y_position == 8
      printed_board += square_color.to_s
      printed_board += NEW_LINE if position.y_position == 1
    end
    printed_board += "   A  B  C  D  E  F  G  H\n"
    print printed_board
  end

  def board_square(position)
    BoardSquare.for(position.to_h)
  end
end

