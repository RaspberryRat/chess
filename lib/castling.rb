# frozen_string_literal: true

class Castling
  def self.castling_moves(board)
    binding.pry

    new(board).castling
  end

  attr_reader :board, :player_colour
  attr_accessor :castling_options

  def initialize(board = nil)
    @board = board
    @player_colour = retrieve_player_colour
    @castling_options = []
  end

  def castling
    king_side_castle
    queen_side_castle
    castling_options
  end

  private

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

  def retrieve_king_row
    board_rows = board.split(" ").shift.split("/")

    return board_rows[0] if player_colour == "b"
    return board_rows[7] if player_colour == "w"
  end

  def king_side_room?
    king_row = expand_row(retrieve_king_row)
    blank = "."

    if player_colour == "w"
      king = "K"
      rook = "R"
    else
      king = "k"
      rook = "r"
    end

    return false unless king_row[4] == king
    return false unless king_row[5] == blank && king_row[6] == blank
    return false unless king_row[7] == rook

    true
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
