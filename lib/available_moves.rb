# frozen_string_literal: true

require_relative "legal_move"
require_relative "game_pieces"

# checks if currently available move for piece at given location and board state
class AvailableMoves
  def self.possible_move(location, board, current_player)
    new(location, board, current_player).possible_moves
  end

  attr_reader :location, :board, :move_list, :move_template, :current_player
  attr_accessor :piece

  def initialize(location, board, current_player, piece = nil)
    @location = location
    @board = board
    @piece = piece
    @current_player = current_player
    @move_list = GamePiece
    @move_template = LegalMove
  end

  def possible_moves
    return false unless piece_at_location?

    return false unless verify_colour

    piece_location = convert_to_grid
    current_board_state = expand_notation

    moves =
      move_template.for(
        move_list.moves(piece),
        piece,
        piece_location,
        current_board_state
      )
    return false if moves.flatten.empty?

    moves
  end

  private

  def piece_at_location?
    return true if what_piece

    false
  end

  def verify_colour
    selected_piece = what_piece
    if current_player.marker == "white"
      return false unless selected_piece == selected_piece.upcase
    end

    if current_player.marker == "black"
      return false unless selected_piece == selected_piece.downcase
    end

    true
  end

  def what_piece
    square_to_grid = convert_to_grid
    column = square_to_grid[1]
    row = square_to_grid[0]

    board_array = expand_notation
    row = board_array[row]
    game_piece = row[column]
    assign_piece(game_piece)
    return game_piece unless game_piece == "."

    false
  end

  def assign_piece(game_piece)
    @piece = game_piece
  end

  def convert_column(column)
    { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }.fetch(column.to_sym)
  end

  def convert_to_grid
    column = convert_column(location[0])
    row = location[1].to_i - 1
    [row, column]
  end

  # coverts fen notation into an array, if empty square, converts to '.'
  def expand_notation
    board = @board.split(" ").shift
    expanded_board = board.split("/").reverse
    expanded_board.map do |row|
      new_row = []
      row = row.split("")
      row.map do |c|
        c.to_i.positive? ? c.to_i.times { new_row << "." } : new_row << c
      end
      new_row
    end
  end
end
