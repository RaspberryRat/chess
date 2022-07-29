# frozen_string_literal: true

require 'pry-byebug'
class Fen 
  def initialize(field_placement = 1)
    @field_placement = field_placement
  end

  attr_reader :field_placement


  def standard_chess_start
    update_field('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')
  end

  def update_field(new_field)
    @field_placement = new_field
  end
end

notation = notation.chars.map do |c|
  if('1'..'8').include?(c)
    c.to_i
  else
    c
  end

  #TODO NEED TO ADD THIS HERE TO CONVERT