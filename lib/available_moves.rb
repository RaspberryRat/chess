# frozen_string_literal: true

require_relative "legal_move"
require_relative "game_pieces"
require_relative "board_method_module"

include BoardMethods

# checks if currently available move for piece at given location and board state
class AvailableMoves
  def self.possible_move(location, player_colour, board)
    new(location, player_colour, board).possible_moves
  end

  attr_reader :location, :board, :move_list, :move_template, :player_colour
  attr_accessor :piece

  def initialize(location, player_colour, board, piece = nil)
    @location = location
    @board = board
    @piece = piece
    @player_colour = player_colour
    @move_list = GamePiece
    @move_template = LegalMove
  end

  def possible_moves
    return false unless piece_at_location?

    return false unless verify_colour

    piece_location = convert_to_grid
    current_board_state = expand_notation(board)
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
    if player_colour == "w"
      return false unless selected_piece == selected_piece.upcase
    end

    if player_colour == "b"
      return false unless selected_piece == selected_piece.downcase
    end

    true
  end

  def what_piece
    square_to_grid = convert_to_grid
    column = square_to_grid[1]
    row = square_to_grid[0]

    board_array = expand_notation(board)
    row = board_array[row]
    game_piece = row[column]
    assign_piece(game_piece)
    return game_piece unless game_piece == "."

    false
  end

  def assign_piece(game_piece)
    @piece = game_piece
  end

  def convert_to_grid
    column = convert_column(location[0])
    row = location[1].to_i - 1
    [row, column]
  end
end
