require_relative '../lib/board'

describe Board do
  describe '#build_board' do

    subject(:new_game) { described_class.new }

    context 'when new game is started creates a 8 by 8 board ' do
      board_array =
        [[1, 1],
        [1, 2],
        [1, 3],
        [1, 4],
        [1, 5],
        [1, 6],
        [1, 7],
        [1, 8],
        [2, 1],
        [2, 2],
        [2, 3],
        [2, 4],
        [2, 5],
        [2, 6],
        [2, 7],
        [2, 8],
        [3, 1],
        [3, 2],
        [3, 3],
        [3, 4],
        [3, 5],
        [3, 6],
        [3, 7],
        [3, 8],
        [4, 1],
        [4, 2],
        [4, 3],
        [4, 4],
        [4, 5],
        [4, 6],
        [4, 7],
        [4, 8],
        [5, 1],
        [5, 2],
        [5, 3],
        [5, 4],
        [5, 5],
        [5, 6],
        [5, 7],
        [5, 8],
        [6, 1],
        [6, 2],
        [6, 3],
        [6, 4],
        [6, 5],
        [6, 6],
        [6, 7],
        [6, 8],
        [7, 1],
        [7, 2],
        [7, 3],
        [7, 4],
        [7, 5],
        [7, 6],
        [7, 7],
        [7, 8],
        [8, 1],
        [8, 2],
        [8, 3],
        [8, 4],
        [8, 5],
        [8, 6],
        [8, 7],
        [8, 8]]

      it 'returns 8*8 array' do
        chess_board = new_game.build_board
        expect(chess_board).to eq(board_array)
      end
    end
  end

  describe 'print_board' do
    context 'when method called, display board in terminal' do

      subject(:current_board) { described_class.new }

      green_square = "\u001b[48;5;107m"
      white_square = "\u001b[48;5;231m"
      empty_row_green = "#{green_square}   #{white_square}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{white_square}   #{green_square}   " * 4 + "\u001b[0m\n"
      printed_board = "8 #{empty_row_green}"\
                      "7 #{empty_row_white}"\
                      "6 #{empty_row_green}"\
                      "5 #{empty_row_white}"\
                      "4 #{empty_row_green}"\
                      "3 #{empty_row_white}"\
                      "2 #{empty_row_green}"\
                      "1 #{empty_row_white}"\
                      "   A  B  C  D  E  F  G  H"\
                      "\n"

      
      it 'prints board to terminal' do
        expect(current_board).to receive(:print).with(printed_board)
        current_board.print_board
      end
    end
  end
end

