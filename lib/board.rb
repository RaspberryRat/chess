# frozen_string_literal: true


require 'pry-byebug'

require_relative 'fen'
require_relative 'piece_module'
require_relative 'board_square'
include PieceVariables

# playing board for pieces
class Board
  attr_accessor :board, :printed_board
  attr_reader :game_pieces_array

  def initialize(board = Fen.piece_placement)
    # @game_pieces_array = game_pieces_array
    @board = board
    @printed_board = nil
  end

  def print_board
    row_number = 8
    printed_board = "#{row_number.to_s} "
    previous_color = 'white'
    board.each do |notation|
      if notation.is_a?(Integer)
        notation.times do
          square_color = board_square(notation, previous_color)
          previous_color = previous_color == 'green' ? 'white' : 'green'
          printed_board += "#{square_color}"
        end
      else
        square_color = board_square(notation, previous_color)
        previous_color = previous_color == 'green' ? 'white' : 'green'
      end
      printed_board += "#{square_color}"
      if square_color.to_s == NEW_LINE
        row_number -= 1
        printed_board += "#{row_number.to_s} "
      end
    end
    printed_board += NEW_LINE
    printed_board += "   A  B  C  D  E  F  G  H\n"
    print printed_board
  end

  def board_square(notation, color)
    BoardSquare.for(notation, color)
  end
end

