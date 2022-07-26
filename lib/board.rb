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

  # TODO this isn't done
  def print_board
    single_pair = "\u001b[4m\u001b[48;5;107m  \u001b[48;5;231m  "
    one_line = single_pair * 4 + "\u001b[0m\n"
    output = one_line * 8
    puts output
  end
end

