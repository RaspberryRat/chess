# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require 'pry-byebug'

class Game

  attr_reader :board
  
  def initialize(board = Board.new)
    @board = board
  end

  def start

    puts "Select the piece you would like to move (e.g., 'a4')"
    piece_selection = player_input
    legal_selection?(piece_selection)
    puts 'What square do you want to move to?'
    square_selection = player_input
    legal_move?(square_selection)
    
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

  def legal_selection?(selected_square)
    return true if board.piece_at_location?(selected_square)

    puts "There is no piece at location '#{selected_square}'."

    start
  end

  def legal_move?(selected_square)

    return true if board.allowed_move?(selected_square)

    puts 'That is not a legal move, please choose a different destination.'



  end

  

end
