module BoardMethods
  def expand_notation(board_state)
    board = board_state.split(" ").shift
    expanded_board = board.split("/").reverse
    expanded_board.map do |row|
      new_row = []
      row = row.split("")
      row.map do |c|
        c.to_i.positive? ? c.to_i.times { new_row << "." } : new_row << c
      end
      new_row
    end
  end

  # takes the board state from fen notation, finds the w or b after first space
  def turn_indicator_from_fen_notation(board_state)
    notation = board_state

    notation[notation.index(" ") + 1]
  end

  #returns the letter for the column
  def column_to_letter(num)
    {
      0 => "a",
      1 => "b",
      2 => "c",
      3 => "d",
      4 => "e",
      5 => "f",
      6 => "g",
      7 => "h"
    }.fetch(num)
  end

  def convert_column(column)
    { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }.fetch(column.to_sym)
  end

  def clear_screen
    system("clear") || system("cls")
  end
end