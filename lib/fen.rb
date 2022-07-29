# frozen_string_literal: true

require 'pry-byebug'
class Fen 
  def initialize(field_placement = standard_chess_start)
    @field_placement = update_field(field_placement)
  end

  attr_reader :field_placement


  def standard_chess_start
    'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR'
  end

  def update_field(new_field)
    @field_placement = new_field.chars.map do |c|
      if('1'..'8').include?(c)
        c.to_i
      else
        c
      end
    end
  end

  def to_s
    @field_placement
  end
end
