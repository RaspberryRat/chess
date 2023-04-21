# frozen_string_literal: true

require_relative "whitesquare"
require_relative "../modules/piece_module"

# determines if piece is green for board squares
class Square
  def self.for(notation, previous_color)
    if previous_color == "white"
      Square
    else
      WhiteSquare
    end.new(notation)
  end

  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{GREEN_SQUARE}#{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end
