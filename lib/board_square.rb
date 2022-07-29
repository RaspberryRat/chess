# frozen_string_literal: true
require 'pry-byebug'
require_relative 'piece_module'

include PieceVariables
include StandardChessPieces

# superclass for board squares
class BoardSquare
  def self.for(notation, previous_color)
    case notation
    when '/'
      BoardSquare.new(notation)
    when Integer
      Square.for(notation, previous_color)
    else
      OccupiedSquare.for(notation, previous_color)
    end
  end

  attr_reader :notation

  def initialize(notation)
   @notation = notation
  end

  def to_s
    NEW_LINE
  end
end

# determines if piece is green for board squares
class Square < BoardSquare

  def self.for(notation, previous_color)

    if previous_color == 'white'
      Square
    else
      WhiteSquare
    end.new(notation)
  end

  def initialize(notation)

    super(notation)
  end

  def to_s
    "#{GREEN_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is white for board squares
class WhiteSquare < BoardSquare
  def initialize(notation)

    super(notation)
  end

  def to_s
    "#{WHITE_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green and has a game piece for board squares
class OccupiedSquare < Square
  def self.for(notation, previous_color)
    if previous_color == 'white'
      OccupiedSquare
    else
      OccupiedWhiteSquare
    end.new(notation)
  end

  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{GREEN_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)} "
  end
end

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare < OccupiedSquare

  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{WHITE_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)} "
  end
end