# frozen_string_literal: true

require_relative 'board'

class Move

  attr_reader :location, :destination

  def initialize(location, destination)
    @location = location
    @destination = destination
  end
end






def legal_selection?(piece_selected)
  return true if board.piece_at_location?(piece_selected)

  puts "There is no piece at location '#{piece_selected}'."

  start
end


def legal_move?(piece_selected, move_selected)
  return true if board.allowed_move?(piece_selected, move_selected)

  puts 'That is not a legal move, please choose a different destination.'
  move_loop(piece_selected)
end

private

def move_loop(piece_selected)
  puts 'What square do you want to move to?'
  move_selected = player_input
  return move_selected if legal_move?(piece_selected, move_selected)
end