# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require 'pry-byebug'

class Game

  attr_reader :board
  
  def initialize
    @board = Board.new
  end

  def start

    puts "Select the piece you would like to move (e.g., 'a4')"
    piece_selection = player_input
    legal_move?(piece_selection)
    
  end

  def player_input
    loop do
      choice = gets.chomp
      return choice if verify_input(choice)

      puts "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
    end
  end

  def verify_input(input)
    # return false if input.length > 2 #find a better way to do this
    return true if /^[a-h][1-8]$/.match(input)

    false
  end

  def lega
  
  end

end
