# frozen_string_literal: true

require_relative 'piece_module'
require 'pry-byebug'

include PieceVariables

class GamePiece
  def self.for(piece)
    {
      P: Pawn,
      p: BlackPawn,
      R: Rook,
      r: BlackRook,
      N: Knight,
      n: BlackKnight,
      B: Bishop,
      b: BlackBishop,
      Q: Queen,
      q: BlackQueen,
      K: King,
      k: BlackKing,
    }.fetch(piece).new
  end

  def self.moves(piece, current_location)
    self.for(piece).moves(current_location)
  end
  
  
  attr_reader :piece, :location, :piece_number
  attr_accessor :move_list

  def initialize
    @piece = nil
    @piece_number = piece_number
    @location = nil
  end

end

class Pawn < GamePiece
  def initialize(location = nil)
    @location = location
    @piece = WHITE_PAWN
  end

  def moves(current_location)
    move_list = []
    move_list.push([0, 1], [1, 1], [-1, 1])
    move_list << [0, 2] if current_location[1] == '2'
    move_list.sort
  end
end

class BlackPawn < Pawn
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_PAWN
  end

  def moves(current_location)
    move_list = []
    move_list.push([0, -1], [1, -1], [-1, -1])
    move_list << [0, -2] if current_location[1] == '7'

    move_list.sort
  end
end

class Rook < GamePiece
  def initialize(location = nil)
    @location = location
    @piece = WHITE_ROOK
  end
end

class BlackRook < GamePiece
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_ROOK
  end

end

class Knight < GamePiece
  
  def initialize(location = nil)
    @location = location
    @piece = WHITE_KNIGHT
  end

end

class BlackKnight < Knight
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_KNIGHT
  end

end

class Bishop < GamePiece
  
  def initialize(location = nil)
    @location = location
    @piece = WHITE_BISHOP
  end

end

class BlackBishop < Bishop
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_BISHOP
  end

end

class Queen < GamePiece
  
  def initialize(location = nil)
    @location = location
    @piece = WHITE_QUEEN
  end

end

class BlackQueen < Queen
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_QUEEN
  end

end

class King < GamePiece
  
  def initialize(location = nil)
    @location = location
    @piece = WHITE_KING
  end

end

class BlackKing < King
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_KING
  end

end
