# frozen_string_literal: true

class Player
  attr_reader :name, :computer

  def initialize(name, player, computer)
    @name = name
    @player = player
    @computer = computer
  end
end
