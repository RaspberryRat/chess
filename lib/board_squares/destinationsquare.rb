# frozen_string_literal: true

require_relative "destinationwhitesquare"
require_relative "../modules/piece_module"

# Passes a highlighed square for potential destination
class DestinationSquare
  def self.for(notation, previous_color)
    if previous_color == "white"
      DestinationSquare
    else
      DestinationWhiteSquare
    end.new(notation)
  end
  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{DESTINATION_SQUARE_GREEN} #{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end
