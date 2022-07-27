# frozen_string_literal: true

require_relative 'board'

class Game

  attr_accessor :game_pieces
  
  def initialize(game_pieces = [])
    @game_pieces = game_pieces
  end

  def start
    create_pieces
  end

  def create_pieces
    count = 0
    24.times do
      GamePiece.for(count)
      count += 1
    end
  end
end