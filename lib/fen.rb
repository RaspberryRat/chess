# frozen_string_literal: true
require 'pry-byebug'

#TODO UNSURE IF THIS CLASS IS NEEDED!

# Takes fen notation
class Fen 
  
  def initialize(field_placement = nil)
    @field_placement = FenToArray.convert(field_placement)
  end

  attr_reader :field_placement

  def self.piece_placement(field_placement = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')
    new(field_placement).field_placement
  end

  def to_s
    @field_placement
  end
end

# Used to convert to an Array to be usable by Board
class FenToArray

  def initialize(fen_notation)
    @fen_notation = fen_notation
  end

  attr_accessor :fen_notation

  def self.convert(fen_notation)
    new(fen_notation).update_field
  end

  attr_accessor

  def update_field
    fen_notation.chars.map do |c|
      if('1'..'8').include?(c)
        c.to_i
      else
        c
      end
    end
  end
end
