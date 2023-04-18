# frozen_string_literal: true
require_relative 'check'
require_relative 'board_method_module'
require_relative "available_moves"
require_relative "check"
require_relative 'move'

include BoardMethods

require "pry-byebug"

class Checkmate

  def self.checkmate(board_state)
    new(board_state).checkmate?
  end

  attr_reader :board_state

  def initialize(board_state)
    @board_state = board_state
  end

  def checkmate?
    current_player_piece_locations = current_player_pieces
    current_player_colour = turn_indicator_from_fen_notation(board_state)

    current_player_piece_locations.each do |piece|
      moves = available_moves(piece, current_player_colour, board_state)
      destinations = legal_destinations(piece, moves)
      next if destinations.nil?
      destinations.each do |move|
        sim_move = simulate_move(piece, move)
        return false unless king_in_check?(sim_move)
      end
    end
    true
  end

  private

  def current_player_pieces
    current_player_colour = turn_indicator_from_fen_notation(board_state)

    piece_locations = []

    expanded_board = expand_notation(board_state)
    expanded_board.each_with_index do |column, row|
      next if column.all?(".")

      column.each_with_index do |piece, column|
        next if piece == "."
        next if opposite_piece_color?(current_player_colour, piece)

        column_index = column_to_letter(column)
        row_index = row + 1
        piece_locations << column_index.to_s + row_index.to_s
      end
    end
    piece_locations
  end

  def king_in_check?(board)
    Check.checker(board)
  end

  def simulate_move(piece, move)
    move_piece(piece, move)
  end

  def move_piece(location, destination)
    moved_piece = Move.move_loop(location, destination, board_state)
    return false unless moved_piece

    # returns only board, not captured piece
    moved_piece[0]
  end
end
