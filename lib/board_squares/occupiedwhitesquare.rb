# frozen_string_literal: true

require_relative "../modules/piece_module"

# determines if piece is white and has a game piece for board squares
class OccupiedWhiteSquare
  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{WHITE_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{WHITE_SQUARE} #{ESCAPE_CODE}"
  end
end
