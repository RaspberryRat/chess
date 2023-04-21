# frozen_string_literal: true

require_relative "../modules/piece_module"

class DestinationWhiteSquare
  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{DESTINATION_SQUARE_WHITE} #{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end
