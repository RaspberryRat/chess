# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require 'pry-byebug'

include StandardChessPieces

class Game

  attr_reader :board
  
  def initialize
    @board = Board.new(game_pieces)
  end

  def start
    
 
  end

end
