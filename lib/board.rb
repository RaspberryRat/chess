# frozen_string_literal: true
require 'pry-byebug'
require_relative 'main'
require_relative 'piece_module'
include PieceVariables

# playing board for pieces
class Board
  attr_accessor :board

  def initialize(board = positions(build_board))
    @board = board
  end

  def build_board
    board_array = []
    (1..8).to_a.repeated_permutation(2) { | arr| board_array << arr }
    board_array
  end

  BoardLocations = Struct.new(:x_position, :y_position, :game_piece)
  def positions(location)
    location.map { |cell| BoardLocations.new(cell[0], cell[1], cell[2]) }
  end

  def print_board
    chess_board = ''
    # empty_green_space = BoardSqaure.new
    # empty_white_space = BoardSquare.new

    board.reverse.map do |position|
      square_color = BoardSquare.for(position)
      # sets number to indicate row
      chess_board += "#{position.x_position} " if position.y_position == 8
      chess_board += square_color.to_s
      chess_board += NEW_LINE if position.y_position == 1
    end
    chess_board += "   A  B  C  D  E  F  G  H\n"
    print chess_board
  end
end

# superclass for board squares
class BoardSquare
  def self.for(position)
    # decides if both values are even or odd
    same_parity = position.x_position.even? == position.y_position.even?

    if same_parity
      GreenSquare
    else
      WhiteSquare
    end.for(position)
  end

  attr_reader :x_position, :y_position

  def initialize(position)
    @x_position = position.x_position
    @y_position = position.y_position
  end

  def to_s
    "#{GREEN_SQUARE} #{EMPTY_SPACE}"
  end
end

# determines if piece is green for board squares
class GreenSquare < BoardSquare
  def self.for(position)

    if position.game_piece.nil?
      GreenSquare
    else
      OccupiedGreenSqaure
    end.new(position)
  end

  attr_reader :x_position, :y_position

  def initialize(position)
    super(position)
  end


end

# determines if piece is white for board squares
class WhiteSquare < BoardSquare
  def self.for(position)

    if position.game_piece.nil?
      WhiteSquare
    else
      OccupiedWhiteSquare
    end.new(position)
  end

  attr_reader :x_position, :y_position

  def initialize(position)
    super(position)
  end

  def to_s
    "#{WHITE_SQUARE} #{EMPTY_SPACE}"
  end

end

# determines if piece is green and has a game piece for board squares

class OccupiedGreenSqaure <GreenSquare

  attr_reader :x_position, :y_position

  def initialize(position)
    super(position)
  end


end

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare < WhiteSquare

  attr_reader :x_position, :y_position

  def initialize(position)
    super(position)
  end

end