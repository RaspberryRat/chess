module MoveModule
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
