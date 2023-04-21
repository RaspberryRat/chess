# frozen_string_literal: true
require_relative "board"

class Highlight
  def self.print(board, selection, destinations)
    new(board, selection, destinations).highlight_positions
  end

  attr_reader :board, :selection, :destinations
  attr_accessor :destination_array, :selection_position

  def initialize(board, selection, destinations)
    @board = board
    @selection = selection
    @destinations = destinations
    @selection_position = nil
    @destination_array = []
  end

  def highlight_positions
    @selection_position = get_position_code(selection)
    destinations.each { |d| @destination_array << get_position_code(d) }

    print_selection_board
  end

  private

  # takes coordinate position from board, ex. 'a1' and returns position, ex, 1
  def get_position_code(coordinates)
    column_code(coordinates[0]) + row_code(coordinates[1])
  end

  def print_selection_board
    Board.new(
      board.board,
      board.cap_pieces,
      selection_position,
      destination_array
    ).print_board
  end

  def column_code(column)
    { a: 8, b: 7, c: 6, d: 5, e: 4, f: 3, g: 2, h: 1 }.fetch(column.to_sym).to_i
  end

  def row_code(row)
    {
      1 => 0,
      2 => 8,
      3 => 16,
      4 => 24,
      5 => 32,
      6 => 40,
      7 => 48,
      8 => 56
    }.fetch(row.to_i).to_i
  end
end

board = Board.new

Highlight.new(board, "a2", %w[a3 a4]).highlight_positions
