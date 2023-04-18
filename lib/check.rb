# frozen_string_literal: true
require_relative "board_method_module"
require_relative "available_moves"
require "pry-byebug"

include BoardMethods

class Check
  def self.checker(board_state)
    new(board_state).king_in_check?
  end

  attr_reader :board_state

  def initialize(board_state)
    @board_state = board_state
  end

  def king_in_check?
    location = king_location(board_state)
    # go through not current player's pieces to see if they have a move to location
    potential_moves = []
    other_player_pieces = locations_not_current_player

    other_player_pieces.each do |piece|
      potential_moves << other_player_available_moves(piece, board_state)
    end
    return true if potential_moves.flatten.include?(location)

    false
  end

  private

  def locations_not_current_player
    current_player_colour = turn_indicator_from_fen_notation(board_state)

    not_current_player_piece_locations = []

    expanded_board = expand_notation(board_state)
    expanded_board.each_with_index do |column, row|
      next if column.all?(".")

      column.each_with_index do |piece, column|
        next if piece == "."
        next unless opposite_piece_color?(current_player_colour, piece)

        column_index = column_to_letter(column)
        row_index = row + 1
        not_current_player_piece_locations << column_index.to_s + row_index.to_s
      end
    end
    not_current_player_piece_locations
  end

  def other_player_available_moves(piece, board_state)
    list_of_destinations = []

    player_colour = turn_indicator_from_fen_notation(board_state)

    opp_player_colour = player_colour == "w" ? "b" : "w"

    moves = available_moves(piece, opp_player_colour, board_state)
    return nil unless moves

    list_of_destinations << legal_destinations(piece, moves)
    list_of_destinations.flatten
  end

  def available_moves(piece_selected, player_colour, board = board_state)
    moves = AvailableMoves.possible_move(piece_selected, player_colour, board)
  end

  # take piece location and moves to create destinations allowed
  def legal_destinations(piece, moves)
    return unless moves

    destinations_available = []
    piece_column = convert_column(piece[0])
    piece_row = piece[1].to_i
    # piece notation is [row, column]
    piece_notation = [piece_row, piece_column]
    i = 0
    moves.length.times do
      destination_row = piece_notation[0] + moves[i][0]
      destination_column = column_to_letter(piece_notation[1] + moves[i][1])
      destinations_available << destination_column.to_s + destination_row.to_s
      i += 1
    end
    destinations_available
  end
end
