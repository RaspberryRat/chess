# frozen_string_literal: true

class Player
  attr_reader :name, :computer

  def initialize(name, computer)
    @name = name
    @computer = computer
  end
end
