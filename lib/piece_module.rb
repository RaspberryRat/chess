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
  NEW_LINE = "\u001b[0m\n"
  EMPTY_SPACE = "  "
end

module StandardChessPieces
  CHESS_PIECES =
    {
      pawn: 8,
      black_pawn: 8,
      rook: 2,
      black_rook: 2,
      knight: 2,
      black_knight: 2,
      bishop: 2,
      black_bishop: 2,
      queen: 1,
      black_queen: 1,
      king: 1,
      black_king: 1,
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