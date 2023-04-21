# frozen_string_literal: true

require_relative "occupieddestinationwhitesquare"
require_relative "../modules/piece_module"

class OccupiedDestination
  def self.for(notation, previous_color)
    if previous_color == "white"
      OccupiedDestination
    else
      OccupiedDestinationWhite
    end.new(notation)
  end

  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{DESTINATION_SQUARE_GREEN} #{CHESS_PIECES.fetch(notation.to_sym)}#{DESTINATION_SQUARE_GREEN} #{ESCAPE_CODE}"
  end
end
