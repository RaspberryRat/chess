# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require 'pry-byebug'

class Move
  def self.move_loop(location, destination, board)
    new(location, destination, board).move_loop
  end

  attr_reader :location, :destination, :board, :piece_template

  def initialize(location, destination, board, piece_template = GamePiece)
    @location = location
    @destination = destination
    @board = board
    @piece_template = piece_template
  end

  def move_loop
    return false unless legal_selection?

    return false unless legal_move?

    true
  end

  def legal_selection?
    return true if board.piece_at_location?(location)

    puts "There is no piece at location '#{location}'."
    false
  end

  def legal_move?
    return true if board.allowed_move?(location, destination)

    puts 'That is not a legal move, please choose a different destination.'
    false
  end

  def piece_at_location?
    return true if what_piece

    false
  end

  def what_piece
    square_to_grid = convert_to_grid(location)
    column = square_to_grid[0]
    row = square_to_grid[1]

    board_array = expand_notation
    row = board_array[row]
    piece = row[column]
    return piece unless piece == '.'

    false
  end

  def allowed_move?
    piece_type = what_piece
    move_list = piece_template.moves(piece_type)
    return true if move_checker?(move_list)

    false
  end

  def available_moves(move_list)
    possible_moves = []

    return false if possible_moves.empty?
    possible_moves
  end


  #TODO might have to remove this as it won't do what I want anymore
  def move_checker?(move_list)
    current_location = convert_to_grid(location)
    converted_destination = convert_to_grid(destination)
    desired_move = []

    i = 0
    2.times do
      desired_move << converted_destination[i] - current_location[i]
      i += 1
    end
    return true if move_list.include?(desired_move)

    false
  end

  private

  def convert_column(column)
    {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7
    }.fetch(column.to_sym)
  end

  def convert_to_grid(board_square)
    column = convert_column(board_square[0])
    row = board_square[1].to_i - 1
    [column, row]
  end

  # coverts fen notation into an array, if empty square, converts to '.'
  def expand_notation
    expanded_board = board.split('/').reverse
    expanded_board.map do |row|
      new_row = []
      row = row.split('')
      row.map do |c|
        if c.to_i.positive?
          c.to_i.times do
            new_row << '.'
          end
        else
          new_row << c
        end
      end
      new_row
    end
  end
end
