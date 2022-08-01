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

  def initialize(board = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')
    # @game_pieces_array = game_pieces_array
    @board = board
  end

  def print_board
    row_number = 8
    printed_board = "#{row_number.to_s} "
    previous_color = 'white'
    convert_notation.each do |notation|
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
      printed_board += square_color.to_s
      if square_color.to_s == NEW_LINE
        row_number -= 1
        printed_board += row_number.to_s + " "
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
      if('1'..'8').include?(c)
        c.to_i
      else
        c
      end
    end
  end

  def piece_at_location?(square_selected)
    return true unless what_piece(square_selected).nil?

    false
  end

  def what_piece(square_selected)
    column = square_selected[0]
    # substract 1 to convert to array index 
    row = square_selected[1].to_i - 1
    board_array = expand_notation

    # convert column letters to index
    column = {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7
    }.fetch(column.to_sym)

    row = board_array[row]
    piece = row[column]
    return piece unless piece == '.'

    'empty square'
  end

  # coverts fen notation into an array, if empty square, converts to '.'
  def expand_notation
    expanded_board = board.split('/').reverse
    expanded_board.map do |row|
      new_row = []
      row = row.split('')
      row.map do |c|
        if c.to_i > 0
          c.to_i.times do
            new_row << '.'
          end
        else
          new_row << c
        end
      end
      row = new_row
    end
  end
end
