# frozen_string_literal: true

require_relative 'piece_module'

class GamePiece

  attr_reader :piece
    def initialize(location = nil)
    @piece = nil
    @location = nil
end

class Pawn < GamePiece
    def initialize
    super(location)
    @piece = WHITE_PAWN
    
  end

end

class BlackPawn < Pawn
    def initialize
    super(location)
    @piece = BLACK_PAWN
  end

end

class Rook < GamePiece
    def initialize
    super(location)
    @piece = WHITE_ROOK
  end

end

class BlackRook < Rook
    def initialize
    super(location)
    @piece = BLACK_ROOK
  end

end

class Knight < GamePiece
    def initialize
    super(location)
    @piece = WHITE_KNIGHT
  end

end

class BlackKnight < Knight
    def initialize
    super(location)
    @piece = BLACK_KNIGHT
  end
  
end

class Bishop < GamePiece
    def initialize
    super(location)
    @piece = WHITE_BISHOP
  end
end

class BlackBishop < Bishop
    def initialize
    super(location)
    @piece = BLACK_BISHOP
  end

end

class Queen < GamePiece
    def initialize
    super(location)
    @piece = WHITE_QUEEN
  end

end

class BlackQueen < Queen
    def initialize
    super(location)
    @piece = BLACK_QUEEN
  end
end

class King < GamePiece
    def initialize
    super(location)
    @piece = WHITE_KING
  end
end

class BlackKing < King
    def initialize
    super(location)
    @piece = BLACK_KING
  end
end