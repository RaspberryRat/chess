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
    @location = set_start_location
  end

  def set_start_location
    false
  end
end

class Pawn < GamePiece
    def initialize
      @piece = WHITE_PAWN

    def set_start_location

      location = case piece_number
      when 9
        [2, 1]
      when 10
        [2, 2]
      when 11
        [2, 3]
      when 12
        [2, 4]
      when 13
        [2, 5]
      when 14
        [2, 6]
      when 15
        [2, 7]
      when 16
        [2, 8]
      end
    end
  end


end

class BlackPawn < Pawn
  def initialize
      @piece = BLACK_PAWN
  end

end

class Rook < GamePiece
  def initialize

    @piece = WHITE_ROOK
  end

  def set_start_location
    return location = [1, 1] if piece_number == 1

    location = [1, 8]
  end
end

class BlackRook < GamePiece
  def initialize

    @piece = BLACK_ROOK
  end

  def set_start_location
    return location = [8, 1] if piece_number == 17

    location = [8, 8]
  end
end

class Knight < GamePiece
  def initialize
    @piece = WHITE_KNIGHT
  end

  def set_start_location
    return location = [1, 2] if piece_number == 2

    location = [1, 7]
  end
end

class BlackKnight < Knight
  def initialize
    @piece = BLACK_KNIGHT
  end

  def set_start_location
    return location = [8, 2] if piece_number == 18

    location = [8, 7]
  end
end

class Bishop < GamePiece
  def initialize
    @piece = WHITE_BISHOP
  end

  def set_start_location
    return location = [1, 3] if piece_number == 3

    location = [1, 6]
  end
end

class BlackBishop < Bishop
  def initialize
    @piece = BLACK_BISHOP
  end

  def set_start_location
    return location = [8, 3] if piece_number == 19

    location = [8, 6]
  end
end

class Queen < GamePiece
  def initialize
    @piece = WHITE_QUEEN
  end

  def set_start_location
    location = [1, 4]
  end
end

class BlackQueen < Queen
  def initialize
    @piece = BLACK_QUEEN
  end

  def set_start_location
    location = [8, 4]
  end
end

class King < GamePiece
  def initialize
    @piece = WHITE_KING
  end

  def set_start_location
    location = [1, 5]
  end
end

class BlackKing < King
  def initialize
    @piece = BLACK_KING
  end

  def set_start_location
    location = [8, 5]
  end
end
