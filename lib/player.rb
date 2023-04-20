# frozen_string_literal: true

class Player
  def initialize(game, name, player, computer)
    @game = game
    @name = name
    @player = player
    @marker = assign_colour
    @computer = computer
  end
  attr_reader :game, :name, :marker, :computer

  def assign_colour
    return "white" if @player == 1

    "black"
  end
end
