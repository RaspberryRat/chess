# frozen_string_literal: true

require_relative "./board_squares/board_square"
require_relative "game_pieces"
require_relative "./modules/piece_module"

# playing board for pieces
class Board
  attr_accessor :board, :square_counter
  attr_reader :piece_template, :cap_pieces, :selection, :destination_array

  def initialize(
    board = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq",
    cap_pieces = [],
    selection = nil,
    destination_array = []
  )
    @board = board
    @cap_pieces = cap_pieces
    @selection = selection
    @destination_array = destination_array
    @square_counter = 64
  end

  def print_board
    printed_board = "\n\n\n"
    printed_board += cap_pieces.empty? ? "\n" * 4 : pieces_captured

    row_number = 8
    printed_board += "#{row_number} "
    previous_color = "white"
    convert_notation.each do |notation|
      break if notation == " "

      if notation.is_a?(Integer)
        notation.times do
          if destination_array.include?(square_counter)
            square_color =
              board_square(notation, previous_color, selection, square_counter)
          else
            square_color = board_square(notation, previous_color)
          end
          previous_color = previous_color == "green" ? "white" : "green"
          printed_board += square_color.to_s
          @square_counter -= 1
        end
      else
        if square_counter == selection && notation != "/"
          square_color = board_square(notation, previous_color, selection)
        elsif destination_array.include?(square_counter) && notation != "/"
          square_color =
            board_square(notation, previous_color, selection, square_counter)
        else
          square_color = board_square(notation, previous_color)
        end
        previous_color = previous_color == "green" ? "white" : "green"
        @square_counter -= 1 unless notation == "/"
      end
      printed_board += "  #{row_number} " if square_color.to_s == NEW_LINE
      printed_board += square_color.to_s
      if square_color.to_s == NEW_LINE
        row_number -= 1
        printed_board += "#{row_number} "
      end
    end
    printed_board += "  1 "
    printed_board += NEW_LINE
    printed_board += "   A  B  C  D  E  F  G  H\n"
    print printed_board
  end

  private

  def board_square(notation, color, selected = nil, destination = nil)
    BoardSquare.for(notation, color, selected, destination)
  end

  def convert_notation
    board.chars.map { |c| ("1".."8").include?(c) ? c.to_i : c }
  end

  def pieces_captured
    return if cap_pieces.empty?

    white_pieces = []
    black_pieces = []

    cap_pieces.each do |piece|
      piece_symbol = CHESS_PIECES.fetch(piece.to_sym)
      white_pieces << piece_symbol if piece_colour(piece) == "white"
      black_pieces << piece_symbol if piece_colour(piece) == "black"
    end
    white_piece_printout = format_for_print(white_pieces)
    black_piece_printout = format_for_print(black_pieces)
    "Captured Pieces\nWhite pieces: #{white_piece_printout}\nBlack pieces: #{black_piece_printout}\n\n"
  end

  def piece_colour(piece)
    return "white" if piece.upcase == piece

    "black"
  end

  def format_for_print(pieces)
    print_out = ""
    pieces.each { |piece| print_out += "#{piece} " }
    print_out
  end
end

Board.new.print_board
