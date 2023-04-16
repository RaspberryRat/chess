# frozen_string_literal: true

class Castling
  attr_reader :board, :current_player

  def initialize(board, current_player)
    @board = board
    @current_player = current_player
  end

  def castling_available?
    true
  end
end
