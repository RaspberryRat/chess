# frozen_string_literal: true

class Player
  @@player_count = 0
  def initialize(game, name, player)
    @@player_count += 1
    @game = game
    @name = name
    @player = player
    @marker = assign_colour
  end
  attr_reader :game, :name, :marker

  def assign_colour
    return "white" if @player == 1

    "black"
  end
end
