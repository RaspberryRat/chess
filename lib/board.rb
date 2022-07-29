# frozen_string_literal: true

require_relative 'fen'

require 'pry-byebug'

require_relative 'piece_module'
require_relative 'board_square'
include PieceVariables

# playing board for pieces
class Board
  attr_accessor :board, :printed_board
  attr_reader :game_pieces_array

  def initialize(board = Fen.standard_chess_start)
    # @game_pieces_array = game_pieces_array
    @board = board
    @printed_board = nil
  end

  # def build_board
  #   board_array = []
  #   (1..8).to_a.repeated_permutation(2) { | arr| board_array << arr }
  #   board_array
  # end

  # BoardLocations = Struct.new(:x_position, :y_position, :game_piece)
  # def positions(location)
  #   location.map { |cell| BoardLocations.new(cell[0], cell[1], cell[2]) }
  # end

  def print_board
    row_number = 8
    printed_board = row_number

    board.chars.each do |notation|
      square_color = board_square(notation)
      # sets number to indicate row
      printed_board += square_color.to_s
    end
    printed_board += "   A  B  C  D  E  F  G  H\n"
    print printed_board
  end

  def board_square(notation)
    BoardSquare.for(notation)
  end
end

