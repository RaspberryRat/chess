# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require 'pry-byebug'

include StandardChessPieces

class Game

  attr_reader :board
  
  def initialize
    @board = Board.new
  end

  def start

    puts "Select the piece you would like to move (e.g., 'a4')"
    piece_selection = player_input
    
  end

  def player_input
    loop do
      choice = gets.chomp
      return choice if verify_input(choice)

      puts "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
    end

  end
  # TODO need to add test
  def verify_input(input)
    return true if input.match(/[a-h]+[1-8]/)

    false
  end

end
