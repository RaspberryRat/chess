# frozen_string_literal: true
require "pry-byebug"
require_relative "piece_module"

include PieceVariables
include StandardChessPieces

# TODO add square highlights here
# superclass for board squares
class BoardSquare
  def self.for(notation, previous_color, selected = nil, destination = nil)
    choose_selected_square(notation) if selected != nil
    choose_destination_square(notation) if destination != nil
    choose_normal_square(notation, previous_color)
  end

  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    NEW_LINE
  end

  def self.choose_normal_square(notation, previous_color)
    case notation
    when "/"
      BoardSquare.new(notation)
    when Integer
      Square.for(notation, previous_color)
    else
      OccupiedSquare.for(notation, previous_color)
    end
  end

  def self.choose_selected_square
    SelectedSquare.new(notation)
  end

  def self.choose_destination_square(notation)
    DestinationSquare.new(notation)
  end
end

# determines if piece is green for board squares
class Square < BoardSquare
  def self.for(notation, previous_color)
    if previous_color == "white"
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

# Passes a highlighed square for potential destination
class DestinationSquare < BoardSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{DESTINATION_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green and has a game piece for board squares
class OccupiedSquare < Square
  def self.for(notation, previous_color)
    if previous_color == "white"
      OccupiedSquare
    else
      OccupiedWhiteSquare
    end.new(notation)
  end

  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{GREEN_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{GREEN_SQUARE} "
  end
end

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare < OccupiedSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{WHITE_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{WHITE_SQUARE} "
  end
end

# Passes highlighted selected square
class SelectedSquare < OccupiedSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{SELECTED_SQUARE} "
  end
end
