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

  def opposite_piece_color?(current_player_colour, piece)
    return false if piece == piece.upcase && current_player_colour == "w"
    return false if piece == piece.downcase && current_player_colour == "b"

    true
  end

  def king_location(board_state)
    expanded_board = expand_notation(board_state)
    current_king = current_player_king(board_state)
    current_king_location = ""
    expanded_board.each_with_index do |column, row|
      next unless column.include?(current_king)
      column_index = column_to_letter(column.index(current_king))
      row_index = row + 1
      current_king_location = column_index.to_s + row_index.to_s
    end
    current_king_location
  end

  def current_player_king(board_state)
    return "K" if turn_indicator_from_fen_notation(board_state) == "w"

    return "k" if turn_indicator_from_fen_notation(board_state) == "b"
  end

  def available_moves(piece_selected, player_colour, board)
    moves = AvailableMoves.possible_move(piece_selected, player_colour, board)
  end

  # take piece location and moves to create destinations allowed
  def legal_destinations(piece, moves)
    return unless moves

    destinations_available = []
    piece_column = convert_column(piece[0])
    piece_row = piece[1].to_i
    # piece notation is [row, column]
    piece_notation = [piece_row, piece_column]
    i = 0
    moves.length.times do
      destination_row = piece_notation[0] + moves[i][0]
      destination_column = column_to_letter(piece_notation[1] + moves[i][1])
      destinations_available << destination_column.to_s + destination_row.to_s
      i += 1
    end
    destinations_available
  end

  def current_player_pieces(board_state)
    current_player_colour = turn_indicator_from_fen_notation(board_state)

    piece_locations = []

    expanded_board = expand_notation(board_state)
    expanded_board.each_with_index do |column, row|
      next if column.all?(".")

      column.each_with_index do |piece, column|
        next if piece == "."
        next if opposite_piece_color?(current_player_colour, piece)

        column_index = column_to_letter(column)
        row_index = row + 1
        piece_locations << column_index.to_s + row_index.to_s
      end
    end
    piece_locations
  end

  def save_notation_after_piece_placement(board)
    post_piece_notation = board.split(" ")
    post_piece_notation.shift
    post_piece_notation.join(" ")
  end

  def convert_to_grid(board_square)
    column = convert_column(board_square[0])
    row = board_square[1].to_i - 1
    [row, column]
  end

  def what_piece(board_location, board)
    square_to_grid = convert_to_grid(board_location)
    column = square_to_grid[1]
    row = square_to_grid[0]

    board_array = expand_notation(board)
    row = board_array[row]
    piece = row[column]
    return piece unless piece == "."

    false
  end

  def array_to_fen_notation(board_array)
    # then start loop, take row 0, combine to string, if . convert to #, and increment by 1 each .

    board_array = board_array.reverse
    i = 0
    fen_notation = ""
    board_array.length.times do
      unless board_array[i].include?(".")
        fen_notation += board_array[i].join
      else
        j = 0
        board_array[i].length.times do
          break if j > 7
          unless board_array[i][j] == "."
            fen_notation += board_array[i][j]
            j += 1
          else
            empty_space = 0
            loop do
              unless board_array[i][j] == "."
                fen_notation += empty_space.to_s
                break
              end
              empty_space += 1
              j += 1
            end
          end
        end
      end
      i += 1
      j = 0
      fen_notation += "/" unless i == 8
    end
    fen_notation
  end

  def add_post_piece_notation(piece_notation, other_notation)
    "#{piece_notation} #{other_notation}"
  end
end
