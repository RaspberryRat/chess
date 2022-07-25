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
end