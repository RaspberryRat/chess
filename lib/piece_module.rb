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
end