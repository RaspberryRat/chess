# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'

class Game

  attr_accessor :game_pieces
  
  def initialize(game_pieces = [])
    @game_pieces = game_pieces
  end

  def start
    game_pieces = create_pieces
  end

  def create_pieces
    count = 0
    array = []
    32.times do
      array << next_piece(count)
      count += 1
    end
    array
  end

  def next_piece(count)
    GamePiece.for(count)
  end
end