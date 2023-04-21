module PieceVariables
  WHITE_KING = "\u2654"
  WHITE_QUEEN = "\u2655"
  WHITE_ROOK = "\u2656"
  WHITE_BISHOP = "\u2657"
  WHITE_KNIGHT = "\u2658"
  WHITE_PAWN = "\u2659"

  BLACK_KING = "\u001b[38;5;240m\u265A\u001b[0m"
  BLACK_QUEEN = "\u001b[38;5;240m\u265B\u001b[0m"
  BLACK_ROOK = "\u001b[38;5;240m\u265C\u001b[0m"
  BLACK_BISHOP = "\u001b[38;5;240m\u265D\u001b[0m"
  BLACK_KNIGHT = "\u001b[38;5;240m\u265E\u001b[0m"
  BLACK_PAWN = "\u001b[38;5;240m\u265F\u001b[0m"

  GREEN_SQUARE = "\u001b[48;5;107m"
  WHITE_SQUARE = "\u001b[48;5;252m"
  SELECTED_SQUARE = "\u001b[44;1m"
  DESTINATION_SQUARE_GREEN = "\u001b[101;1m"
  DESTINATION_SQUARE_WHITE = "\u001b[101m"

  NEW_LINE = "\u001b[0m\n"
  EMPTY_SPACE = "   "
  ESCAPE_CODE = "\u001b[0m"
end

module StandardChessPieces
  include PieceVariables

  CHESS_PIECES = {
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
    k: BLACK_KING
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
    black_king: [8, 5]
  }
end
