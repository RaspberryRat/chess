# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require 'pry-byebug'

include StandardChessPieces

class Game

  attr_accessor :game_pieces
  
  def initialize(game_pieces = [])
    @game_pieces = game_pieces
    @board = Board.new(game_pieces)
  end

  def start
    game_pieces = create_pieces
    
    assign_start_location
  end

  def create_pieces
    array = []
    CHESS_PIECES.each do |piece, amount|
      amount.times do
        array << next_piece(piece)
      end
    end
    array
  end

  def next_piece(piece)
    GamePiece.for(piece)
  end

  def assign_start_location
    game_pieces.each do |piece|
      # identify piece, check if any other piece of same object has location, if not assign first one from array
      other_locations = []
      game_pieces.each do |another_piece|
        if piece.class == another_piece.class
          other_locations << another_piece.location
        end
      end
      
    end
  end
end

Game.new.start