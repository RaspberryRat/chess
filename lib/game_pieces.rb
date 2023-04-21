# frozen_string_literal: true

require_relative "piece_module"

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
      k: BlackKing
    }.fetch(piece.to_sym).new
  end

  def self.moves(piece)
    self.for(piece).moves
  end

  attr_reader :piece, :location, :piece_number
  attr_accessor :move_list

  def initialize
    @piece = nil
    @piece_number = piece_number
    @location = nil
  end

  def diagonal_moves(maximum_distance)
    move_list = []
    i = 1
    maximum_distance.times do
      move_list << [i, i]
      move_list << [i, -i]
      move_list << [-i, i]
      move_list << [-i, -i]
      i += 1
    end
    move_list
  end

  def straight_moves(maximum_distance)
    move_list = []
    (1..maximum_distance).each do |n|
      move_list << [0, n]
      move_list << [n, 0]
      move_list << [0, n * -1]
      move_list << [n * -1, 0]
    end
    move_list
  end
end

class Pawn < GamePiece
  def initialize(location = nil)
    @location = location
    @piece = WHITE_PAWN
  end

  def moves
    [[1, 0], [2, 0], [1, -1], [1, 1]]
  end
end

class BlackPawn < Pawn
  def initialize(location = nil)
    @location = location
    @piece = BLACK_PAWN
  end

  def moves
    [[-1, 0], [-2, 0], [-1, -1], [-1, 1]]
  end
end

class Rook < GamePiece
  def initialize(location = nil)
    @location = location
    @piece = WHITE_ROOK
  end

  def moves
    straight_moves(7)
  end
end

class BlackRook < Rook
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

  def moves
    [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
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

  def moves
    diagonal_moves(7)
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

  def moves
    move_list = straight_moves(7) + diagonal_moves(7)
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

  def moves
    move_list = diagonal_moves(1) + straight_moves(1)
  end
end

class BlackKing < King
  def initialize(location = nil)
    @location = location
    @piece = BLACK_KING
  end
end
