# frozen_string_literal: true
require_relative "./modules/piece_module"

include PieceVariables, StandardChessPieces

# TODO add square highlights here
# superclass for board squares
class BoardSquare
  def self.for(notation, previous_color, selected = nil, destination = nil)
    unless destination.nil?
      return choose_destination_square(notation, previous_color)
    end
    return choose_selected_square(notation) unless selected.nil?

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

  def self.choose_selected_square(notation)
    SelectedSquare.new(notation)
  end

  def self.choose_destination_square(notation, previous_color)
    if notation.is_a?(Integer)
      DestinationSquare.for(notation, previous_color)
    else
      OccupiedDestination.for(notation, previous_color)
    end
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
    "#{GREEN_SQUARE} #{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end

# determines if piece is white for board squares
class WhiteSquare < BoardSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{WHITE_SQUARE} #{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end

# Passes a highlighed square for potential destination
class DestinationSquare < BoardSquare
  def self.for(notation, previous_color)
    if previous_color == "white"
      DestinationSquare
    else
      DestinationWhiteSquare
    end.new(notation)
  end
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{DESTINATION_SQUARE_GREEN} #{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end

class DestinationWhiteSquare < BoardSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{DESTINATION_SQUARE_WHITE} #{EMPTY_SPACE}#{ESCAPE_CODE}"
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
    "#{GREEN_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{GREEN_SQUARE} #{ESCAPE_CODE}"
  end
end

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare < OccupiedSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{WHITE_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{WHITE_SQUARE} #{ESCAPE_CODE}"
  end
end

# Passes highlighted selected square
class SelectedSquare < OccupiedSquare
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{SELECTED_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{SELECTED_SQUARE} #{ESCAPE_CODE}"
  end
end

class OccupiedDestination < Square
  def self.for(notation, previous_color)
    if previous_color == "white"
      OccupiedDestination
    else
      OccupiedDestinationWhite
    end.new(notation)
  end

  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{DESTINATION_SQUARE_GREEN} #{CHESS_PIECES.fetch(notation.to_sym)}#{DESTINATION_SQUARE_GREEN} #{ESCAPE_CODE}"
  end
end

# determines if piece is white and has a game piece for board squares
class OccupiedDestinationWhite < OccupiedDestination
  def initialize(notation)
    super(notation)
  end

  def to_s
    "#{DESTINATION_SQUARE_WHITE} #{CHESS_PIECES.fetch(notation.to_sym)}#{DESTINATION_SQUARE_WHITE} #{ESCAPE_CODE}"
  end
end
