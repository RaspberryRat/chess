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
    piece_selected = player_input
    legal_selection?(piece_selected)
    move_selected = move_loop(piece_selected)
  
    
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

  def legal_selection?(piece_selected)
    return true if board.piece_at_location?(piece_selected)

    puts "There is no piece at location '#{piece_selected}'."

    start
  end

  def legal_move?(piece_selected, move_selected)
    return true if board.allowed_move?(piece_selected, move_selected)

    puts 'That is not a legal move, please choose a different destination.'
    move_loop(piece_selected)
  end

  private

  def move_loop(piece_selected)
    puts 'What square do you want to move to?'
    move_selected = player_input
    return move_selected if legal_move?(piece_selected, move_selected)
  end
end
