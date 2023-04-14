# frozen_string_literal: true

require_relative "string"
require "pry-byebug"

class LegalMove
  def self.for(move_list, piece, location, board)
    {
      P: MovePawn,
      p: MovePawn,
      R: MoveRook,
      r: MoveRook,
      N: MoveKnight,
      n: MoveKnight,
      B: MoveBishop,
      b: MoveBishop,
      Q: MoveQueen,
      q: MoveQueen,
      K: MoveKing,
      k: MoveKing
    }.fetch(piece.to_sym).new(move_list, location, piece, board).moves
  end

  attr_reader :move_list, :location, :piece, :board
  attr_accessor :possible_moves, :current_colour, :temp_move_list

  def initialize(move_list, location, piece, board)
    @move_list = move_list
    @location = location
    @piece = piece
    @board = board
    @possible_moves = []
    @current_colour = piece_colour(piece)
    @temp_move_list = []
  end

  def piece_colour(piece)
    return "white" if piece.is_upper?

    "black"
  end

  def temporary_move_list
    move_list.each do |move|
      next_square = [move[0] + location[0], move[1] + location[1]]
      next if next_square.any?(&:negative?)
      next if next_square.any? { |n| n > 7 }

      destination_square = board[next_square[0]][next_square[1]]
      # next iteration if square is same colour piece
      if destination_square == "."
        temp_move_list << move
      elsif current_colour == piece_colour(destination_square)
        next
      else
        temp_move_list << move
      end
    end
  end

  def vertical_moves
    if temp_move_list.include?([1, 0])
      possible_moves << [1, 0]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([i, 0])
        # last_square_empty?
        prev_move = [i - 1, 0]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [i, 0] if temp_move_list.include?([i, 0])
        i += 1
      end
    end
    if temp_move_list.include?([-1, 0])
      possible_moves << [-1, 0]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([-i, 0])
        prev_move = [(i - 1) * -1, 0]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [-i, 0] if temp_move_list.include?([-i, 0])

        i += 1
      end
    end
  end

  def horizontal_moves
    if temp_move_list.include?([0, 1])
      possible_moves << [0, 1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([0, i])

        prev_move = [0, i - 1]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [0, i] if temp_move_list.include?([0, i])

        i += 1
      end
    end
    if temp_move_list.include?([0, -1])
      possible_moves << [0, -1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([0, -i])

        prev_move = [0, (i - 1) * -1]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [0, -i] if temp_move_list.include?([0, -i])

        i += 1
      end
    end
  end

  def diagonal_moves
    if temp_move_list.include?([1, 1])
      possible_moves << [1, 1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([i, i])

        prev_move = [i, i]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [i, i] if temp_move_list.include?([i, i])

        i += 1
      end
    end
    if temp_move_list.include?([-1, 1])
      possible_moves << [-1, 1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([-i, i])

        prev_move = [(i - 1) * -1, i - 1]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [-i, i] if temp_move_list.include?([-i, i])
        i += 1
      end
    end
    if temp_move_list.include?([1, -1])
      possible_moves << [1, -1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([i, -i])

        prev_move = [i - 1, (i - 1) * -1]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [i, -i] if temp_move_list.include?([i, -i])

        i += 1
      end
    end
    if temp_move_list.include?([-1, -1])
      possible_moves << [-1, -1]
      i = 2
      temp_move_list.length.times do
        break unless temp_move_list.include?([-i, -i])

        prev_move = [(i - 1) * -1, (i - 1) * -1]
        last_move = [prev_move[0] + location[0], prev_move[1] + location[1]]
        last_square = board[last_move[0]][last_move[1]]
        break unless last_square == "."

        possible_moves << [-i, -i] if temp_move_list.include?([-i, -i])

        i += 1
      end
    end
  end
end

class MoveQueen < LegalMove
  def moves
    temporary_move_list
    vertical_moves
    horizontal_moves
    diagonal_moves
    possible_moves
  end
end

# TODO Castling
class MoveRook < LegalMove
  def moves
    temporary_move_list
    vertical_moves
    horizontal_moves
    possible_moves
  end
end

class MoveBishop < LegalMove
  def moves
    temporary_move_list
    diagonal_moves
    possible_moves
  end
end

# TODO Castling
class MoveKing < LegalMove
  def moves
    temporary_move_list
    vertical_moves
    horizontal_moves
    diagonal_moves
    possible_moves
  end
end

class MoveKnight < LegalMove
  def moves
    temporary_move_list
    temp_move_list
  end
end

class MovePawn < LegalMove
  def moves
    available_move_list = temporary_move_list
    available_move_list = at_start_location(available_move_list)
    # available_move_list = move_direction(available_move_list)
    available_move_list = blocked_square(available_move_list)
    available_move_list = piece_to_capture(available_move_list)
    available_move_list
  end

  def piece_to_capture(moves)
    move_list = []

    moves.each do |move|
      move_list << move if move[1] == 0
      next if move[0] == 0
      next_square = [move[0] + location[0], move[1] + location[1]]
      next if next_square[0].negative? || next_square[1].negative?
      next if next_square[1] > 7
      destination = board[next_square[0]][next_square[1]]
      next if destination == "."
      move_list << move unless current_colour == piece_colour(destination)
    end
    move_list
  end

  def at_start_location(moves)
    if current_colour == "white"
      moves.delete_at(moves.index([2, 0])) unless location[0] == 1
    else
      moves.delete_at(moves.index([-2, 0])) unless location[0] == 6
    end
    moves
  end

  def blocked_square(moves)
    move_list = []

    moves.each do |move|
      move_list << move unless move[1] == 0
      next unless move[1] == 0
      next_square = [move[0] + location[0], move[1] + location[1]]
      destination = board[next_square[0]][next_square[1]]
      next unless destination == "."
      move_list << move
    end
    first_move_blocked(move_list)
  end

  private

  def first_move_blocked(moves)
    return moves if moves.include?([1, 0])

    moves.delete_at(moves.index([2, 0])) if moves.include?([2, 0])
    moves
  end
end
