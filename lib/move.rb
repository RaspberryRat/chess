# frozen_string_literal: true

require_relative 'board'
require 'pry-byebug'

class Move
  def self.move_loop(location, destination, board)
    new(location, destination, board).move_loop
  end

  attr_reader :location, :destination, :board

  def initialize(location, destination, board)
    @location = location
    @destination = destination
    @board = board
  end

  def move_loop
    return false unless legal_selection?

    return false unless legal_move?

    true
  end

  def legal_selection?
    return true if board.piece_at_location?(location)

    puts "There is no piece at location '#{location}'."
    false
  end

  def legal_move?
    return true if board.allowed_move?(location, destination)

    puts 'That is not a legal move, please choose a different destination.'
    false
  end
end
