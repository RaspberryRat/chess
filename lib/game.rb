# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require_relative 'move'
require 'pry-byebug'

class Game

  attr_reader :board, :move
  
  def initialize(board = Board.new, move = Move)
    @board = board
    @move = move
  end

  def start
    loop do
      puts "Select the piece you would like to move (e.g., 'a4')"
      piece_selected = player_input
      # legal_selection?(piece_selected)
      destination = player_input
      break if move_piece(piece_selected, destination)
    end
  end

  def player_input
    loop do
      choice = gets.chomp
      return choice if verify_input(choice)

      puts "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
    end
  end

  def verify_input(input)
    return true if /^[a-h][1-8]$/.match(input)

    false
  end

  private
  
  def move_piece(location, destination)
    return true if Move.new(location, destination)
    
    false
  end
end
