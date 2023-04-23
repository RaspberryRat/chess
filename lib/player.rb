# frozen_string_literal: true

class Player
  attr_reader :name, :computer
  attr_accessor :move_log

  def initialize(name, player, computer, move_log = [])
    @name = name
    @player = player
    @computer = computer
    @move_log = move_log
  end
end
