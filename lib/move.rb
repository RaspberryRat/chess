# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require_relative 'string'
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
    column = square_to_grid[1]
    row = square_to_grid[0]

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

  #TODO: only works for Queen, maybe need new class to send to 
  def available_moves(move_list, piece_type)
    possible_moves = []

    current_board_state = expand_notation
    piece_location = convert_to_grid(location)
    current_colour = piece_colour(piece_type)
    
    temp_move_list = []

    move_list.each do |move|
      next_square = [move[0] + piece_location[0], move[1] + piece_location[1]]
      next if next_square.any?(&:negative?)
      next if next_square.any? { |n| n > 7 }

      destination_square = current_board_state[next_square[0]][next_square[1]]

      # next iteration if square is same colour piece
      if destination_square == '.'
        temp_move_list << move
      elsif current_colour == piece_colour(destination_square)
        next
      else
        temp_move_list << move
      end
    end
    
    # vertical moves
    if temp_move_list.include?([1, 0])
      possible_moves << [1, 0]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([i, 0])
        # last_square_empty?
        prev_move = [i - 1, 0]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [i, 0]
        i += 1
      end
    end
    if temp_move_list.include?([-1, 0])
      possible_moves << [-1, 0]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([-i, 0])
        prev_move = [(i - 1) * - 1, 0]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [-i, 0]
        i += 1
      end
    end
      # horizontal moves
    if temp_move_list.include?([0, 1])
      possible_moves << [0, 1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([0, i])
        prev_move = [0, i]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [0, i]
        i += 1
      end
    end
    if temp_move_list.include?([0, -1])
      possible_moves << [0, -1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([0, -i])
        prev_move = [0, (i - 1) * - 1]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [0, -i]
        i += 1
      end
    end
    
    # diagonal moves
    if temp_move_list.include?([1, 1])
      possible_moves << [1, 1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([i, i])
        prev_move = [i, i]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [i, i]
        i += 1
      end
    end
    if temp_move_list.include?([-1, 1])
      possible_moves << [-1, 1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([-i, i])
        prev_move = [(i - 1) * - 1, i - 1]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [-i, i]
        i += 1
      end
    end
    if temp_move_list.include?([1, -1])
      possible_moves << [1, -1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([i, -i])
        prev_move = [i - 1, (i - 1) * - 1]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [i, -i]
        i += 1
      end
    end
    if temp_move_list.include?([-1, -1])
      possible_moves << [-1, -1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([-i, -i])
        prev_move = [(i - 1) * - 1, (i - 1) * - 1]
        last_move = [prev_move[0] + piece_location[0], prev_move[1] + piece_location[1]]
        last_square = current_board_state[last_move[0]][last_move[1]]
        break unless last_square == '.'
    
        possible_moves << [-i, -i]
        i += 1
      end
    end

    return false if possible_moves.flatten.empty?

    possible_moves
  end


  # TODO: might have to remove this as it won't do what I want anymore
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

  def piece_colour(piece_type)
    return 'white' if piece_type.is_upper?

    'black'
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
    [row, column]
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
