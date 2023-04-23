# frozen_string_literal: true

require_relative "../modules/piece_module"
require_relative "square"
require_relative "occupiedsquare"
require_relative "selectedsquare"
require_relative "destinationsquare"
require_relative "occupieddestinationsquare"

include PieceVariables

# superclass for board squares
class BoardSquare
  def self.for(notation, previous_color, selected = nil, destination = nil)
    unless destination.nil?
      return choose_destination_square(notation, previous_color)
    end
    return choose_selected_square(notation) unless selected.nil?

    choose_normal_square(notation, previous_color)
  end

  attr_reader :notation

  def initialize(notation)
    @notation = notation
  end

  def to_s
    NEW_LINE
  end

  def self.choose_normal_square(notation, previous_color)
    case notation
    when "/"
      BoardSquare.new(notation)
    when Integer
      Square.for(notation, previous_color)
    else
      OccupiedSquare.for(notation, previous_color)
    end
  end

  def self.choose_selected_square(notation)
    SelectedSquare.new(notation)
  end

  def self.choose_destination_square(notation, previous_color)
    if notation.is_a?(Integer)
      DestinationSquare.for(notation, previous_color)
    else
      OccupiedDestination.for(notation, previous_color)
    end
  end
end
