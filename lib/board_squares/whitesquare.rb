# frozen_string_literal: true

require_relative "../modules/piece_module"

# determines if piece is white for board squares
class WhiteSquare
  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{WHITE_SQUARE}#{EMPTY_SPACE}#{ESCAPE_CODE}"
  end
end
