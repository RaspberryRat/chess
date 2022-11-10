module PieceVariables
  WHITE_KING = "\u2654"
  WHITE_QUEEN = "\u2655"
  WHITE_ROOK = "\u2656"
  WHITE_BISHOP = "\u2657"
  WHITE_KNIGHT = "\u2658"
  WHITE_PAWN = "\u2659"

  BLACK_KING = "\u265A"
  BLACK_QUEEN = "\u265B"
  BLACK_ROOK = "\u265C"
  BLACK_BISHOP = "\u265D"
  BLACK_KNIGHT = "\u265E"
  BLACK_PAWN = "\u265F"

  GREEN_SQUARE = "\u001b[48;5;107m"
  WHITE_SQUARE = "\u001b[48;5;252m"
  SELECTED_SQUARE = "\u001b[43;1m"
  DESTINATION_SQUARE = "\u001b[41m"
  NEW_LINE = "\u001b[0m\n"
  EMPTY_SPACE = "  "
end

module StandardChessPieces
  include PieceVariables

  CHESS_PIECES =
    {
      P: WHITE_PAWN,
      p: BLACK_PAWN,
      R: WHITE_ROOK,
      r: BLACK_ROOK,
      N: WHITE_KNIGHT,
      n: BLACK_KNIGHT,
      B: WHITE_BISHOP,
      b: BLACK_BISHOP,
      Q: WHITE_QUEEN,
      q: BLACK_QUEEN,
      K: WHITE_KING,
      k: BLACK_KING,
    }

    STARTING_LOCATIONS = {
      pawn: (1..8).to_a.map { |n| [2, n] },
      black_pawn: (1..8).to_a.map { |n| [7, n] },
      rook: [[1, 1], [1, 8]],
      black_rook: [[8, 1], [8, 8]],
      knight: [[1, 2], [1, 7]],
      black_knight: [[8, 2], [8, 7]],
      bishop: [[1, 3], [1, 6]],
      black_bishop: [[8, 3], [8, 6]],
      queen: [1, 4],
      black_queen: [8, 4],
      king: [1, 5],
      black_king: [8, 5],
    }
end