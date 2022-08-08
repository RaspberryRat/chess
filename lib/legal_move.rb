# frozen_string_literal: true

require_relative 'string'

class LegalMove
  def self.for(move_list, piece, location, board)
    {
      # p: MovePawn,
      # R: MoveRook,
      # P: MovePawn,
      # r: MoveRook,
      # N: MoveKnight,
      # n: MoveKnight,
      # B: MoveBishop,
      # b: MoveBishop,
      Q: MoveQueen,
      q: MoveQueen,
      # K: MoveKing,
      # k: MoveKing,
    }.fetch(piece.to_sym).new(move_list, location, piece, board).moves
  end

  attr_reader :move_list, :location, :piece, :board
  def initialize(move_list, location, piece, board)
    @move_list = move_list
    @location = location
    @piece = piece
    @board = board
  end

  def piece_colour(piece)
    return 'white' if piece.is_upper?

    'black'
  end
end

class MoveQueen < LegalMove
  def moves
    possible_moves = []

    current_colour = piece_colour(piece)

    temp_move_list = []

    move_list.each do |move|
      next_square = [move[0] + location[0], move[1] + location[1]]
      next if next_square.any?(&:negative?)
      next if next_square.any? { |n| n > 7 }

      destination_square = board[next_square[0]][next_square[1]]
 
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
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
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == '.'

        possible_moves << [-i, -i]
        i += 1
      end
    end
    possible_moves
  end
end











