# frozen_string_literal: true

require 'pry-byebug'

require_relative 'board_square'
require_relative 'game_pieces'

# playing board for pieces
class Board
  attr_accessor :board
  attr_reader :piece_template

  def initialize(board = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR', piece_template = GamePiece)
    @board = board
    @piece_template = piece_template
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
    square_to_grid = convert_to_grid(square_selected)
    column = square_to_grid[0]
    row = square_to_grid[1]

    board_array = expand_notation
    row = board_array[row]
    piece = row[column]
    return piece unless piece == '.'

    'empty square'
  end

  def allowed_move?(piece_selected, destination)
    piece_type = what_piece(piece_selected)
    possible_moves = piece_template.moves(piece_type)
    return true if move_checker?(piece_selected, destination, possible_moves)

    false
  end

  def move_checker?(piece_selected, destination, move_list)
    current_location = convert_to_grid(piece_selected)
    destination = convert_to_grid(destination)
    desired_move = []

    i = 0
    2.times do
      desired_move << destination[i] - current_location[i]
      i += 1
    end
    return true if move_list.include?(desired_move)

    false
  end

  private

  def convert_column(column)
    {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7
    }.fetch(column.to_sym)
  end

  def convert_to_grid(board_square)
    column = convert_column(board_square[0])
    row = board_square[1].to_i - 1
    [column, row]
  end

  # coverts fen notation into an array, if empty square, converts to '.'
  def expand_notation
    expanded_board = board.split('/').reverse
    expanded_board.map do |row|
      new_row = []
      row = row.split('')
      row.map do |c|
        if c.to_i.positive?
          c.to_i.times do
            new_row << '.'
          end
        else
          new_row << c
        end
      end
      new_row
    end
  end
end
