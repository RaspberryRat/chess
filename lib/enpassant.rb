# frozen_string_literal: true
require_relative "move_module"
require_relative "board_method_module"
require "pry-byebug"

include MoveModule, BoardMethods

class EnPassant
  def self.blank_notation(board_state)
    new(board_state).include_blank_notation
  end

  def self.enpassant(board_state, location, destination)
    new(board_state, location, destination).enpassant_notation
  end

  def self.legal_move?(board_state, location)
    new(board_state, location).enpassant_available?
  end

  def self.moves(board_state, location)
    new(board_state, location).enpassant_move
  end

  def self.last_move_enpassant?(board_state, location, destination)
    new(board_state, location, destination).last_enpassant?
  end

  def self.update_board(board_state, location, destination)
    new(board_state, location, destination).captured_piece
  end

  attr_reader :board_state, :location, :destination, :player_colour

  def initialize(board_state, location = nil, destination = nil)
    @board_state = board_state
    @location = location
    @destination = destination
    @player_colour = turn_indicator_from_fen_notation(board_state)
  end

  def enpassant_notation
    board = remove_enpassant_notation(board_state)
    return board unless pawn?
    return board unless pawn_double_move?

    add_notation
  end

  def enpassant_available?
    return false unless pawn?
    return false if retrieve_enpassant_notation == "-"

    return false unless next_square?
    true
  end

  def enpassant_move
    location_array = convert_to_grid(location)
    destination_array = convert_to_grid(retrieve_enpassant_notation)

    move = []
    move << destination_array[0] - location_array[0]
    move << destination_array[1] - location_array[1]
  end

  def last_enpassant?
    return false unless pawn?
    return false if retrieve_enpassant_notation == "-"

    start_col = convert_column(location[0])
    dest_col = convert_column(destination[0])
    enpass_col = convert_column(retrieve_enpassant_notation[0])

    return false unless destination == retrieve_enpassant_notation

    column_change = enpass_col - start_col
    return false unless column_change.abs == 1

    true
  end

  def captured_piece
    captured_piece_location = find_captured_piece

    board = remove_capture_piece_from_board(captured_piece_location)

    [board, what_piece(captured_piece_location, board_state)]
  end

  def include_blank_notation
    enpassant_note = retrieve_enpassant_notation
    return @board_state if enpassant_note == "-"
    return @board_state if chess_grid_code(enpassant_note)

    @board_state += " -"
    @board_state
  end

  private

  def next_square?
    notation = retrieve_enpassant_notation
    target_col = convert_column(notation[0]).to_i
    target_row = notation[1].to_i
    piece_col = convert_column(location[0]).to_i
    piece_row = location[1].to_i

    column_difference = target_col - piece_col
    row_difference = target_row - piece_row
    return false unless column_difference.abs == 1
    return false unless row_difference.abs == 1

    true
  end

  def chess_grid_code(note)
    return false unless note.length == 2
    return false unless note.match(/[a-h][1-8]/)

    true
  end

  def find_captured_piece
    captured_piece_col = destination[0]
    captured_piece_row = location[1]

    [captured_piece_col, captured_piece_row].join("")
  end

  def remove_capture_piece_from_board(captured_piece_location)
    other_notation = save_notation_after_piece_placement(board_state)
    board_array = expand_notation(board_state)
    cap_piece = convert_to_grid(captured_piece_location)
    board_array[cap_piece[0]][cap_piece[1]] = "."
    other_notation = remove_enpassant_notation(other_notation)
    board = array_to_fen_notation(board_array)
    board = add_post_piece_notation(board, other_notation)
  end

  def remove_enpassant_notation(notation)
    notation = notation.split(" ")
    notation[-1] = "-"
    notation.join(" ")
  end

  def add_notation
    ex_board = board_to_array
    target = location
    col = target[1].to_i

    if player_colour == "w"
      column = col + 1
    elsif player_colour == "b"
      column = col - 1
    end
    target[1] = column.to_s
    ex_board[-1] = target
    ex_board.join(" ")
  end

  def retrieve_enpassant_notation
    board = board_to_array
    board[-1]
  end

  def board_to_array
    board_state.split(" ")
  end

  def pawn?
    piece_location = destination.nil? ? location : destination
    return false if piece_location.include?("castle")

    piece = what_piece(piece_location, board_state)
    return false unless piece
    return true if piece.downcase == "p"

    false
  end

  def pawn_double_move?
    start_col = location[1].to_i
    destin_col = destination[1].to_i

    movement = start_col - destin_col
    return true if movement.abs == 2

    false
  end
end
