# frozen_string_literal: true
require_relative "move_module"
require_relative "board_method_module"
require "pry-byebug"

include MoveModule, BoardMethods

class EnPassant
  def self.enpassant(board_state, location, destination)
    new(board_state, location, destination).enpassant_notation
  end

  attr_reader :board_state, :location, :destination, :player_colour

  def initialize(board_state, location, destination)
    @board_state = board_state
    @location = location
    @destination = destination
    @player_colour = turn_indicator_from_fen_notation(board_state)
  end

  def enpassant_notation
    return board_state unless pawn?
    return board_state unless pawn_double_move?

    add_notation
  end

  private

  def add_notation
    ex_board = board_state.split(" ")
    target = location
    col = target[1].to_i

    if player_colour == "w"
      column = col + 1
    elsif player_colour == "b"
      column = col - 1
    end
    target[1] = column.to_s
    ex_board[-1] = target
    ex_board.join(" ")
  end

  def pawn?
    piece = what_piece(destination, board_state)
    return false unless piece
    return true if piece.downcase == "p"

    false
  end

  def pawn_double_move?
    start_col = location[1].to_i
    destin_col = destination[1].to_i

    movement = start_col - destin_col
    return true if movement.abs == 2

    false
  end
end
