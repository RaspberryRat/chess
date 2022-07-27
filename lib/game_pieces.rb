# frozen_string_literal: true

require_relative 'piece_module'

include PieceVariables

class GamePiece
  def self.for(count)
    case count
    when 1, 8
      Rook
    when 2, 7
      Knight
    when 3, 6
      Bishop
    when 4
      Queen
    when 5
      King
    when 9..16
      Pawn
    when 17, 24
      BlackRook
    when 18, 23
      BlackKnight
    when 19, 22
      BlackBishop
    when 20
      BlackQueen
    when 21
      BlackKing
    when 25..32
      BlackPawn
    end.new

  end
  
  attr_reader :piece

  def initialize(location = nil)
    @piece = nil
    @location = nil
  end
end

class Pawn < GamePiece
    def initialize(location = nil)
      super(location)
      @piece = WHITE_PAWN
  end

end

class BlackPawn < Pawn
  def initialize(location = nil)
      super(location)
      @piece = BLACK_PAWN
  end

end

class Rook < GamePiece
  def initialize(location = nil)
    super(location)
    @piece = WHITE_ROOK
  end

end

class BlackRook < Rook
  def initialize(location = nil)
    super(location)
    @piece = BLACK_ROOK
  end

end

class Knight < GamePiece
  def initialize(location = nil)
    super(location)
    @piece = WHITE_KNIGHT
  end

end

class BlackKnight < Knight
  def initialize(location = nil)
    super(location)
    @piece = BLACK_KNIGHT
  end
  
end

class Bishop < GamePiece
  def initialize(location = nil)
    super(location)
    @piece = WHITE_BISHOP
  end
end

class BlackBishop < Bishop
  def initialize(location = nil)
    super(location)
    @piece = BLACK_BISHOP
  end

end

class Queen < GamePiece
  def initialize(location = nil)
    super(location)
    @piece = WHITE_QUEEN
  end

end

class BlackQueen < Queen
  def initialize(location = nil)
    super(location)
    @piece = BLACK_QUEEN
  end
end

class King < GamePiece
  def initialize(location = nil)
    super(location)
    @piece = WHITE_KING
  end
end

class BlackKing < King
  def initialize(location = nil)
    super(location)
    @piece = BLACK_KING
  end
end
