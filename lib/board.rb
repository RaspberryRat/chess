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
    empty_row_green = "#{green_square}   #{white_square}   " * 4 + "\u001b[0m\n"
    empty_row_white = "#{white_square}   #{green_square}   " * 4 + "\u001b[0m\n"

    i = 8
    chess_board = ''
    8.times do
      chess_board += "#{i.to_s} "
      chess_board += i.even? ? empty_row_green : empty_row_white
      i -= 1
    end
    chess_board += "   A  B  C  D  E  F  G  H\n"
    print chess_board
  end
end

