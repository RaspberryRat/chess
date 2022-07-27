# frozen_string_literal: true

# superclass for board squares
class BoardSquare
  def self.for(x_position, y_position, game_piece)

    # decides if both values are even or odd
    if x_position.even? == y_position.even?
      GreenSquare
    else
      WhiteSquare
    end.for(x_position, y_position, game_piece)
  end

  attr_reader :x_position, :y_position, :game_piece

  def initialize(x_position, y_position, game_piece)
    @x_position = x_position
    @y_position = y_position
    @game_piece = game_piece
  end

  def to_s
    "#{GREEN_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green for board squares
class GreenSquare < BoardSquare
  def self.for(x_position, y_position, game_piece)
    if game_piece.nil?
      GreenSquare
    else
      OccupiedGreenSquare
    end.new(x_position, y_position, game_piece)
  end

  attr_reader :x_position, :y_position, :game_piece

  def initialize(x_position, y_position, game_piece)
    super(x_position, y_position, game_piece)
  end
end

# determines if piece is white for board squares
class WhiteSquare < BoardSquare
  def self.for(x_position, y_position, game_piece)

    if game_piece.nil?
      WhiteSquare
    else
      OccupiedWhiteSquare
    end.new(x_position, y_position, game_piece)
  end

  attr_reader :x_position, :y_position, :game_piece

  def initialize(x_position, y_position, game_piece)
    super(x_position, y_position, game_piece)
  end

  def to_s
    "#{WHITE_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green and has a game piece for board squares
class OccupiedGreenSquare < GreenSquare

  attr_reader :x_position, :y_position, :game_piece

  def initialize(x_position, y_position, game_piece)
    super(x_position, y_position, game_piece)
  end
end

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare < WhiteSquare

  attr_reader :x_position, :y_position, :game_piece

  def initialize(x_position, y_position, game_piece)
    super(x_position, y_position, game_piece)
  end
end