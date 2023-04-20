# frozen_string_literal: true
require "pry-byebug"
require_relative "check"
require_relative "board_method_module"
require_relative "move_module"

include MoveModule, BoardMethods

class Castling
  def self.castling_moves(board)
    new(board).castling
  end

  def self.check_castle_notation(old_board, new_board)
    new(old_board, new_board).update_castling_notation
  end

  attr_reader :board, :player_colour
  attr_accessor :castling_options, :new_board_state

  def initialize(board = nil, new_board_state = nil)
    @board = board
    @player_colour = retrieve_player_colour
    @new_board_state = new_board_state
    @castling_options = []
  end

  def castling
    king_side_castle
    queen_side_castle
    castling_options
  end

  def update_castling_notation
    updated_board_state.rstrip
  end

  private

  def updated_board_state
    king_row_old = expand_row(retrieve_king_row)
    king_row_new = expand_row(retrieve_king_row(new_board_state))

    return remove_castling_fen if king_moved?(king_row_old, king_row_new)
    return remove_kingside_fen if king_rook_moved?(king_row_old, king_row_new)
    return remove_queenside_fen if queen_rook_moved?(king_row_old, king_row_new)

    new_board_state
  end

  def remove_castling_fen
    castling_notation = update_notation

    updated_board = new_board_state.split(" ")
    updated_board[2] = castling_notation
    updated_board.join(" ")
  end

  def remove_queenside_fen
    castling_notation = update_queenside_notation

    updated_board = new_board_state.split(" ")
    updated_board[2] = castling_notation
    updated_board.join(" ")
  end

  def remove_kingside_fen
    castling_notation = update_kingside_notation

    updated_board = new_board_state.split(" ")
    updated_board[2] = castling_notation
    updated_board.join(" ")
  end

  def update_notation
    updated_board = new_board_state.split(" ")
    castle_notation = updated_board[2]
    new_notation = []

    castle_notation.chars.each do |char|
      new_notation << char if char == char.upcase && player_colour == "b"
      new_notation << char if char == char.downcase && player_colour == "w"
    end
    new_notation.join("")
  end

  def update_kingside_notation
    updated_board = new_board_state.split(" ")
    castle_notation = updated_board[2]
    new_notation = []
    castle_notation.chars.each do |char|
      if player_colour == "w"
        new_notation << char unless char == "K"
      elsif player_colour == "b"
        new_notation << char unless char == "k"
      end
    end
    new_notation.join("")
  end

  def update_queenside_notation
    updated_board = new_board_state.split(" ")
    castle_notation = updated_board[2]
    new_notation = []

    castle_notation.chars.each do |char|
      if player_colour == "w"
        new_notation << char unless char == "Q"
      elsif player_colour == "b"
        new_notation << char unless char == "q"
      end
    end
    new_notation.join("")
  end

  def king_moved?(king_row_old, king_row_new)
    king = king_notation
    return false if king_row_old.index(king) == king_row_new.index(king)

    true
  end

  def king_rook_moved?(old_row, new_row)
    rook = rook_notation
    return false if old_row[7] == new_row[7]
    return false if new_row[7] == rook

    true
  end

  def queen_rook_moved?(old_row, new_row)
    rook = rook_notation

    return false if old_row[0] == new_row[0]
    return false if new_row[0] == rook

    true
  end

  def king_side_castle
    return false unless king_side_castling_notation?
    return false unless king_side_room?
    return false if check_kingside?

    castling_options << "kingside castle"
  end

  def check_kingside?
    other_notation = save_notation_after_piece_placement(board)

    board1 = recombine_board(test_board(king_row, 1))
    board1 = add_post_piece_notation(board1, other_notation)
    return true if Check.checker(board1)

    board2 = recombine_board(test_board(king_row, 2))
    board2 = add_post_piece_notation(board1, other_notation)
    return true if Check.checker(board2)

    false
  end

  def king_row
    ex_board = expand_notation(board)
    king_row = player_colour == "w" ? ex_board[0] : ex_board[7]
  end

  def check_queenside?
    other_notation = save_notation_after_piece_placement(board)

    board1 = recombine_board(test_board_queen(king_row, 1))
    board1 = add_post_piece_notation(board1, other_notation)
    return true if Check.checker(board1)

    board2 = recombine_board(test_board_queen(king_row, 2))
    board2 = add_post_piece_notation(board1, other_notation)
    return true if Check.checker(board2)

    board3 = recombine_board(test_board_queen(king_row, 3))
    board3 = add_post_piece_notation(board1, other_notation)
    return true if Check.checker(board3)

    false
  end

  def recombine_board(sim_row)
    ex_board = expand_notation(board)
    ex_board[0] = sim_row if player_colour == "w"
    ex_board[7] = sim_row if player_colour == "b"
    array_to_fen_notation(ex_board)
  end

  def test_board(row, sim)
    king = player_colour == "w" ? "K" : "k"

    row[4] = "."
    row[5] = king if sim == 1
    row[6] = king if sim == 2
    row
  end

  def test_board_queen(row, sim)
    king = player_colour == "w" ? "K" : "k"

    row[4] = "."
    row[3] = king if sim == 1
    row[2] = king if sim == 2
    row[1] = king if sim == 3
    row
  end

  def queen_side_castle
    return false unless queen_side_castling_notation?
    return false unless queen_side_room?
    return false if check_queenside?

    castling_options << "queenside castle"
  end

  def king_side_castling_notation?
    if player_colour == "w"
      return true if retrieve_castling_from_notation.include?("K")
    elsif player_colour == "b"
      return true if retrieve_castling_from_notation.include?("k")
    end
    false
  end

  def queen_side_castling_notation?
    if player_colour == "w"
      return true if retrieve_castling_from_notation.include?("Q")
    elsif player_colour == "b"
      return true if retrieve_castling_from_notation.include?("q")
    end
    false
  end

  def retrieve_castling_from_notation
    board.split(" ")[2]
  end

  def retrieve_player_colour
    board[board.index(" ") + 1]
  end

  def retrieve_king_row(board_state = board)
    board_rows = board_state.split(" ").shift.split("/")

    return board_rows[0] if player_colour == "b"
    return board_rows[7] if player_colour == "w"
  end

  def king_side_room?
    king_row = expand_row(retrieve_king_row)
    blank = "."

    king = king_notation
    rook = rook_notation

    return false unless king_row[4] == king
    return false unless king_row[5] == blank && king_row[6] == blank
    return false unless king_row[7] == rook

    true
  end

  def king_notation
    return "K" if player_colour == "w"

    "k"
  end

  def rook_notation
    return "R" if player_colour == "w"

    "r"
  end

  def queen_side_room?
    king_row = expand_row(retrieve_king_row)
    blank = "."

    if player_colour == "w"
      king = "K"
      rook = "R"
    else
      king = "k"
      rook = "r"
    end

    return false unless king_row[0] == rook
    unless king_row[1] == blank && king_row[2] == blank && king_row[3] == blank
      return false
    end
    return false unless king_row[4] == king

    true
  end

  def expand_row(row)
    king_row = []

    row
      .split("")
      .map do |c|
        c.to_i.positive? ? c.to_i.times { king_row << "." } : king_row << c
      end
    king_row
  end
end
