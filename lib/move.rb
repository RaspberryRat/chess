# frozen_string_literal: true

require_relative "board"
require_relative "game_pieces"
require_relative "legal_move"
require_relative "./modules/board_method_module"

include BoardMethods

class Move
  def self.move_loop(location, destination, board)
    new(location, destination, board).move_loop
  end

  attr_reader :location, :destination, :piece_template, :move_template, :board
  attr_accessor :piece

  def initialize(
    location,
    destination,
    board,
    piece_template = GamePiece,
    piece = nil
  )
    @location = location
    @destination = destination
    @board = board
    @piece_template = piece_template
    @move_template = LegalMove
    @piece = piece
  end

  def move_loop
    return false unless legal_selection?

    return false unless legal_move?

    return move_piece unless castle_move?(what_piece(location, board))

    castle_move
  end

  private

  def move_piece
    other_notation = save_notation_after_piece_placement(board)
    current_location = convert_to_grid(location)
    new_location = convert_to_grid(destination)
    board_array = expand_notation(board)
    piece_at_current_location = what_piece(location, board)
    piece_at_destination = what_piece(destination, board)
    @piece = piece_at_destination
    board_array[current_location[0]][current_location[1]] = "."
    board_array[new_location[0]][new_location[1]] = piece_at_current_location
    board = array_to_fen_notation(board_array)
    board = add_post_piece_notation(board, other_notation)
    board_and_piece = [board, piece_at_destination]
  end

  def castle_move
    other_notation = save_notation_after_piece_placement(board)
    current_location = convert_to_grid(location)

    if destination == "kingside castle"
      new_positions = king_side_castle_location
    elsif destination == "queenside castle"
      new_positions = queen_side_castle_location
    end

    king_new_position = new_positions[0]
    rook_new_position = new_positions[1]
    king_old_position = new_positions[2]
    rook_old_position = new_positions[3]

    king_piece = what_piece(location, board)
    rook_piece = what_rook_colour

    board_array = expand_notation(board)
    board_array[king_old_position[0]][king_old_position[1]] = "."
    board_array[rook_old_position[0]][rook_old_position[1]] = "."
    board_array[king_new_position[0]][king_new_position[1]] = king_piece
    board_array[rook_new_position[0]][rook_new_position[1]] = rook_piece
    board = array_to_fen_notation(board_array)
    board = add_post_piece_notation(board, other_notation)
    board_and_piece = [board, false]
  end

  def what_rook_colour
    return "R" if turn_indicator_from_fen_notation(board) == "w"

    "r"
  end

  def king_side_castle_location
    player_colour = turn_indicator_from_fen_notation(board)

    if player_colour == "w"
      king_new_position = convert_to_grid("g1")
      rook_new_position = convert_to_grid("f1")
      king_old_position = convert_to_grid("e1")
      rook_old_position = convert_to_grid("h1")
    elsif player_colour == "b"
      king_new_position = convert_to_grid("g8")
      rook_new_position = convert_to_grid("f8")
      king_old_position = convert_to_grid("e8")
      rook_old_position = convert_to_grid("h8")
    end
    [king_new_position, rook_new_position, king_old_position, rook_old_position]
  end

  def queen_side_castle_location
    player_colour = turn_indicator_from_fen_notation(board)

    if player_colour == "w"
      king_new_position = convert_to_grid("c1")
      rook_new_position = convert_to_grid("d1")
      king_old_position = convert_to_grid("e1")
      rook_old_position = convert_to_grid("a1")
    elsif player_colour == "b"
      king_new_position = convert_to_grid("c8")
      rook_new_position = convert_to_grid("d8")
      king_old_position = convert_to_grid("e8")
      rook_old_position = convert_to_grid("a8")
    end
    [king_new_position, rook_new_position, king_old_position, rook_old_position]
  end

  def legal_selection?
    return true if piece_at_location?
    return true if destination == "queenside castle"
    return true if destination == "kingside castle"

    puts "There is no piece at location '#{location}'."
    false
  end

  def legal_move?
    return true if allowed_move?

    puts "That is not a legal move, please choose a different destination."
    false
  end

  def piece_at_location?
    return true if what_piece(location, board)

    false
  end

  def allowed_move?
    piece_type = what_piece(location, board)
    return true if castle_move?(piece_type)

    move_list = piece_template.moves(piece_type)
    return true if move_checker?(move_list)

    false
  end

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

  def castle_move?(piece)
    piece_type = piece.downcase
    return true if piece_type == "k" && destination == "kingside castle"
    return true if piece_type == "k" && destination == "queenside castle"

    false
  end
end
