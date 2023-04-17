# frozen_string_literal: true
require "pry-byebug"

class Castling
  def self.castling_moves(board)
    binding.pry

    new(board).castling
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
    # compare board to new board, if King moved, remove all castling notation for that colour
    # if rook moved, remove kingside or queenside notation

    # find king_row

    king_row_old = retrieve_king_row
    king_row_new = retrieve_king_row(new_board_state)
    remove_castling_notation if king_moved?(king_row_old, king_row_new)
  end

  private

  def remove_castling_notation
    castling_notation = update_notation

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

  def king_moved?(king_row_old, king_row_new)
    king = king_notation
    return false unless king_row_old.index(king) == king_row_new.index(king)

    true
  end

  def king_side_castle
    return false unless king_side_castling_notation?
    return false unless king_side_room?

    castling_options << "kingside castle"
  end

  def queen_side_castle
    return false unless queen_side_castling_notation?
    return false unless queen_side_room?

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
