# frozen_string_literal: true

require_relative "occupiedwhitesquare"
require_relative "../modules/piece_module"

# determines if piece is green and has a game piece for board squares
class OccupiedSquare
  def self.for(notation, previous_color)
    if previous_color == "white"
      OccupiedSquare
    else
      OccupiedWhiteSquare
    end.new(notation)
  end

  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{GREEN_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{GREEN_SQUARE} #{ESCAPE_CODE}"
  end
end
