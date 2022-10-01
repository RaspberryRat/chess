# frozen_string_literal: true

require 'pry-byebug'

require_relative 'board_square'
require_relative 'game_pieces'

# playing board for pieces
class Board
  attr_accessor :board
  attr_reader :piece_template

  def initialize(board = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')
    @board = board
  end

  def print_board
    row_number = 8
    printed_board = "#{row_number} "
    previous_color = 'white'
    convert_notation.each do |notation|
      if notation.is_a?(Integer)
        notation.times do
          square_color = board_square(notation, previous_color)
          previous_color = previous_color == 'green' ? 'white' : 'green'
          printed_board += square_color.to_s
        end
      else
        square_color = board_square(notation, previous_color)
        previous_color = previous_color == 'green' ? 'white' : 'green'
      end
      printed_board += square_color.to_s
      if square_color.to_s == NEW_LINE
        row_number -= 1
        printed_board += "#{row_number} "
      end
    end
    printed_board += NEW_LINE
    printed_board += "   A  B  C  D  E  F  G  H\n"
    print printed_board
  end

  def board_square(notation, color)
    BoardSquare.for(notation, color)
  end

  def convert_notation
    board.chars.map do |c|
      if ('1'..'8').include?(c)
        c.to_i
      else
        c
      end
    end
  end
end
