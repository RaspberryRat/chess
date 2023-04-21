# frozen_string_literal: true
require_relative "board"

class Highlight
  attr_reader :board_state, :selection, :destinations
  attr_accessor :destination_array, :selection_position

  def initialize(board, selection, destinations)
    @board = board
    @selection = selection
    @destinations = destinations
    @selection_position = nil
    @destination_array = []
  end

  def highlight_positions
    destination_array = []

    selection_position = get_index(selection)
    destinations.each { |d| destination_array << get_index(d) }

    print_selection_board
  end

  private

  # takes coordinate position from board, ex. 'a1' and returns position, ex, 1
  def get_index(coordinates)
    letter, num = coordinates.split("")
    letter = letter.ord + "a".ord + 1
    num = num.to_i - 1
    num * 8 + letter
  end

  def print_selection_board
    Board.new(
      board.board,
      board.cap_pieces,
      selection_position,
      destination_array
    ).print_board
  end
end
