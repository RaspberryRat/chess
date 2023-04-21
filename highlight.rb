# frozen_string_literal: true

class Highlight
  attr_reader :board_state, :selection, :destinations

  def initialize(board_state, selection, destinations)
    @board_state = board_state
    @selection = selection
    @destinations = destinations
  end

  private

  # takes coordinate position from board, ex. 'a1' and returns position, ex, 1
  def get_index(coordinates)
    letter, num = coordinates.split("")
    letter = letter.ord + "a".ord + 1
    num = num.to_i - 1
    num * 8 + letter
  end
end
