# frozen_string_literal: true
require_relative 'main'

# playing board for pieces
class Board
  attr_reader :board

  def initialize(board = build_board)
    @board = board
  end

  def build_board
    board_array = []
    (1..8).to_a.repeated_permutation(2) { | arr| board_array << arr }
    board_array
  end

  def print_board
    green_square = "\u001b[48;5;107m"
    white_square = "\u001b[48;5;231m"
    new_line = "\u001b[0m\n"

    chess_board = ''
    board.reverse.map do |pos|
      chess_board += "#{pos[0]} " if pos[1] == 8

      first_value = pos[0].even?
      if pos[1].even? == first_value
        chess_board += "#{green_square}   "
      else
        chess_board += "#{white_square}   "
      end
      chess_board += new_line if pos[1] == 1
    end
    chess_board += "   A  B  C  D  E  F  G  H\n"
    print chess_board
  end
end

