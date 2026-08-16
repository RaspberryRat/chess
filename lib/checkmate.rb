# frozen_string_literal: true

require_relative "check"
require_relative "./modules/board_method_module"
require_relative "available_moves"
require_relative "move"

class Checkmate
  include BoardMethods

  def self.checkmate(board_state)
    new(board_state).checkmate?
  end

  def self.stalemate(board_state)
    new(board_state).stalemate?
  end

  attr_reader :board_state

  def initialize(board_state)
    @board_state = board_state
  end

  def checkmate?
    king_in_check?(board_state) && no_legal_moves?
  end

  def stalemate?
    !king_in_check?(board_state) && no_legal_moves?
  end

  private

  def no_legal_moves?
    player_pieces = current_player_pieces(board_state)
    player_colour = turn_indicator_from_fen_notation(board_state)

    player_pieces.each do |piece|
      moves = available_moves(piece, player_colour, board_state)
      destinations = legal_destinations(piece, moves)

      next if destinations.nil?

      destinations.each do |destination|
        simulated_board = simulate_move(piece, destination)
        return false unless king_in_check?(simulated_board)
      end
    end

    true
  end

  def king_in_check?(board)
    Check.checker(board)
  end

  def simulate_move(piece, destination)
    move_piece(piece, destination)
  end

  def move_piece(location, destination)
    moved_piece = Move.move_loop(location, destination, board_state)
    return false unless moved_piece

    moved_piece[0]
  end
end
