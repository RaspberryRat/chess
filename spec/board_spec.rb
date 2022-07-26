require_relative '../lib/board'
require_relative '../lib/piece_module'

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

      empty_row_green = "#{GREEN_SQUARE}   #{WHITE_SQUARE}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{WHITE_SQUARE}   #{GREEN_SQUARE}   " * 4 + "\u001b[0m\n"
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

    context 'when new game, expect board with start positions' do
      subject(:starting_location) { described_class.new(starting_board) }
      let(:starting_board) {[
      [1, 1, WHITE_ROOK],
      [1, 2, WHITE_KNIGHT],
      [1, 3, WHITE_BISHOP],
      [1, 4, WHITE_QUEEN],
      [1, 5, WHITE_KING], 
      [1, 6, WHITE_BISHOP],
      [1, 7, WHITE_KNIGHT],
      [1, 8, WHITE_ROOK],
      [2, 1, WHITE_PAWN],
      [2, 2, WHITE_PAWN],
      [2, 3, WHITE_PAWN],
      [2, 4, WHITE_PAWN],
      [2, 5, WHITE_PAWN],
      [2, 6, WHITE_PAWN],
      [2, 7, WHITE_PAWN],
      [2, 8, WHITE_PAWN],
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
      [7, 1, BLACK_PAWN],
      [7, 2, BLACK_PAWN],
      [7, 3, BLACK_PAWN],
      [7, 4, BLACK_PAWN],
      [7, 5, BLACK_PAWN],
      [7, 6, BLACK_PAWN],
      [7, 7, BLACK_PAWN],
      [7, 8, BLACK_PAWN],
      [8, 1, BLACK_ROOK],
      [8, 2, BLACK_KNIGHT],
      [8, 3, BLACK_BISHOP],
      [8, 4, BLACK_KING],
      [8, 5, BLACK_QUEEN],
      [8, 6, BLACK_BISHOP],
      [8, 7, BLACK_KNIGHT],
      [8, 8, BLACK_ROOK]
      ] }

      empty_row_green = "#{GREEN_SQUARE}   #{WHITE_SQUARE}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{WHITE_SQUARE}   #{GREEN_SQUARE}   " * 4 + "\u001b[0m\n"
      printed_board = 
      "8 "\
      "#{GREEN_SQUARE} #{BLACK_ROOK} "\
      "#{WHITE_SQUARE} #{BLACK_KNIGHT} "\
      "#{GREEN_SQUARE} #{BLACK_BISHOP} "\
      "#{WHITE_SQUARE} #{BLACK_QUEEN} "\
      "#{GREEN_SQUARE} #{BLACK_KING} "\
      "#{WHITE_SQUARE} #{BLACK_BISHOP} "\
      "#{GREEN_SQUARE} #{BLACK_KNIGHT} "\
      "#{WHITE_SQUARE} #{BLACK_ROOK} #{NEW_LINE}"\
      "7 "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{NEW_LINE}"\
      "6 #{empty_row_green}"\
      "5 #{empty_row_white}"\
      "4 #{empty_row_green}"\
      "3 #{empty_row_white}"\
      "2 "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{NEW_LINE}"\
      "1 "\
      "#{WHITE_SQUARE} #{WHITE_ROOK} "\
      "#{GREEN_SQUARE} #{WHITE_KNIGHT} "\
      "#{WHITE_SQUARE} #{WHITE_BISHOP} "\
      "#{GREEN_SQUARE} #{WHITE_KING} "\
      "#{WHITE_SQUARE} #{WHITE_QUEEN} "\
      "#{GREEN_SQUARE} #{WHITE_BISHOP} "\
      "#{WHITE_SQUARE} #{WHITE_KNIGHT} "\
      "#{GREEN_SQUARE} #{WHITE_ROOK} "\
      "#{NEW_LINE}"\
      "   A  B  C  D  E  F  G  H"\
      "\n"
      it 'prints starting board' do
        expect(starting_location).to receive(:print).with(printed_board)
        starting_location.print_board
      end
    end
  end
end

