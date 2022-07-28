# frozen_string_literal: true
require 'pry-byebug'

# superclass for board squares
class BoardSquare
  def self.for(args)
    # decides if both values are even or odd
    if args[:x_position].to_i.even? == args[:y_position].to_i.even?
      GreenSquare
    else
      WhiteSquare
    end.for(args)
  end

  attr_reader :x_position, :y_position, :game_piece

  def initialize(args)
    @x_position = args[:x_position]
    @y_position = args[:y_position]
    @game_piece = args[:game_piece]
  end

  def to_s
    "#{GREEN_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green for board squares
class GreenSquare < BoardSquare
  def self.for(args)
    if args[:game_piece].nil?
      GreenSquare
    else
      OccupiedGreenSquare
    end.new(args)
  end

  def initialize(args)
    super(args)
  end
end

# determines if piece is white for board squares
class WhiteSquare < BoardSquare
  def self.for(args)

    if args[:game_piece].nil?
      WhiteSquare
    else
      OccupiedWhiteSquare
    end.new(args)
  end

  def initialize(args)
    super(args)
  end

  def to_s
    "#{WHITE_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green and has a game piece for board squares
class OccupiedGreenSquare < GreenSquare

  def initialize(args)
    super(args)
  end
end

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare < WhiteSquare

  def initialize(args)
    super(args)
  end
end