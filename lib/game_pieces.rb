# frozen_string_literal: true

require_relative 'piece_module'
require 'pry-byebug'

include PieceVariables

class GamePiece
  def self.for(piece)
    {
      pawn: Pawn,
      black_pawn: BlackPawn,
      rook: Rook,
      black_rook: BlackRook,
      knight: Knight,
      black_knight: BlackKnight,
      bishop: Bishop,
      black_bishop: BlackBishop,
      queen: Queen,
      black_queen: BlackQueen,
      king: King,
      black_king: BlackKing,
    }.fetch(piece).new
  end
  
  attr_reader :piece, :location, :piece_number

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
end

class BlackPawn < Pawn
  
  def initialize(location = nil)
    @location = location
    @piece = BLACK_PAWN
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
