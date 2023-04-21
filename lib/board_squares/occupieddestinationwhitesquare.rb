# frozen_string_literal: true

require_relative "../modules/piece_module"

# determines if piece is white and has a game piece for board squares
class OccupiedDestinationWhite
  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{DESTINATION_SQUARE_WHITE} #{CHESS_PIECES.fetch(notation.to_sym)}#{DESTINATION_SQUARE_WHITE} #{ESCAPE_CODE}"
  end
end
