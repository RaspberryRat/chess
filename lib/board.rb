# frozen_string_literal: true
require 'pry-byebug'
require_relative 'main'
require_relative 'piece_module'
include PieceVariables

# playing board for pieces
class Board
  attr_accessor :board

  def initialize(board = positions(build_board))
    @board = board
  end

  def build_board
    board_array = []
    (1..8).to_a.repeated_permutation(2) { | arr| board_array << arr }
    board_array
  end

  BoardLocations = Struct.new(:x_position, :y_position, :game_piece)
  def positions(location)
    location.map { |cell| BoardLocations.new(cell[0], cell[1], cell[2]) }
  end

  def print_board
    chess_board = ''
    board.reverse.map do |pos|
      chess_board += "#{pos.x_position} " if pos.y_position == 8

      first_value = pos.x_position.even?
      if pos.y_position.even? == first_value
        chess_board += "#{GREEN_SQUARE}"
        chess_board += pos.game_piece.nil? ? "#{EMPTY_SPACE} " : " #{pos.game_piece} "
      else
        chess_board += "#{WHITE_SQUARE}"
        chess_board += pos.game_piece.nil? ? "#{EMPTY_SPACE} " : " #{pos.game_piece} "
      end
      chess_board += NEW_LINE if pos.y_position == 1
    end
    chess_board += "   A  B  C  D  E  F  G  H\n"
    print chess_board
  end
end

