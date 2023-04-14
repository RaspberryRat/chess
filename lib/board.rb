# frozen_string_literal: true

require "pry-byebug"

require_relative "board_square"
require_relative "game_pieces"
require_relative "piece_module"

# playing board for pieces
class Board
  attr_accessor :board
  attr_reader :piece_template, :captured_pieces

  def initialize(
    board = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w",
    captured_pieces = []
  )
    @board = board
    @captured_pieces = captured_pieces
  end

  def print_board
    printed_board = ""
    printed_board += pieces_captured unless captured_pieces.empty?

    row_number = 8
    printed_board += "#{row_number} "
    previous_color = "white"
    convert_notation.each do |notation|
      break if notation == " "
      if notation.is_a?(Integer)
        notation.times do
          square_color = board_square(notation, previous_color)
          previous_color = previous_color == "green" ? "white" : "green"
          printed_board += square_color.to_s
        end
      else
        square_color = board_square(notation, previous_color)
        previous_color = previous_color == "green" ? "white" : "green"
      end
      printed_board += square_color.to_s
      if square_color.to_s == NEW_LINE
        row_number -= 1
        printed_board += "#{row_number} "
      end
    end
    printed_board += NEW_LINE
    printed_board += "   A  B  C  D  E  F  G  H\n"
    print printed_board
  end

  private

  def board_square(notation, color)
    BoardSquare.for(notation, color)
  end

  def convert_notation
    board.chars.map { |c| ("1".."8").include?(c) ? c.to_i : c }
  end

  def pieces_captured
    return if captured_pieces.empty?

    white_pieces = "White pieces captured: "
    black_pieces = "Black pieces captured: "

    captured_pieces.each do |piece|
      piece_symbol = CHESS_PIECES.fetch(piece.to_sym)
      white_pieces += "#{piece_symbol}, " if piece_colour(piece) == "white"
      black_pieces += "#{piece_symbol}, " if piece_colour(piece) == "black"
    end

    "Captured Pieces\n#{white_pieces}\n#{black_pieces}\n\n"
  end

  def piece_colour(piece)
    return "white" if piece.upcase == piece

    "black"
  end

  def last_piece?
  end
end
