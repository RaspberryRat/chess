# frozen_string_literal: true

require_relative "../modules/piece_module"

# Passes highlighted selected square
class SelectedSquare
  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    "#{SELECTED_SQUARE} #{CHESS_PIECES.fetch(notation.to_sym)}#{SELECTED_SQUARE} #{ESCAPE_CODE}"
  end
end
