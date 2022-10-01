# frozen_string_literal: true

require_relative 'legal_move'
require_relative 'game_pieces'

class AvailableMoves

  attr_reader :location, :board, :move_list, :piece, :move_template

  def initialize(location, board, piece)
    @location = location
    @board = board
    @piece = piece
    @move_list = GamePiece.moves(piece)
    @move_template = LegalMove


  end

  def possible_moves
    piece_location = convert_to_grid
    current_board_state = expand_notation
    moves = move_template.for(move_list, piece, piece_location, current_board_state)
    return false if moves.flatten.empty?

    moves
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

  def convert_to_grid
    column = convert_column(location[0])
    row = location[1].to_i - 1
    [row, column]
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
