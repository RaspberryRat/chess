require_relative '../lib/board'
require_relative '../lib/piece_module'

describe Board do
  describe '#print_board' do
    context 'when board is empty' do

      subject(:empty_board) { described_class.new(clear_board) }
      let(:clear_board) { [8, '/', 8, '/', 8, '/', 8, '/', 8, '/', 8, '/', 8, '/', 8] }


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
      it 'prints empty board' do
        expect(empty_board).to receive(:print).with(printed_board)
        empty_board.print_board
      end
    end

    context 'when new game' do

      subject(:new_game) { described_class.new(starting_board) }
      let(:starting_board) { ["r", "n", "b", "q", "k", "b", "n", "r", "/", "p", "p", "p", "p", "p", "p", "p", "p", "/", 8, "/", 8, "/", 8, "/", 8, "/", "P", "P", "P", "P", "P", "P", "P", "P", "/", "R", "N", "B", "Q", "K", "B", "N", "R"] }


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
      "#{GREEN_SQUARE} #{WHITE_QUEEN} "\
      "#{WHITE_SQUARE} #{WHITE_KING} "\
      "#{GREEN_SQUARE} #{WHITE_BISHOP} "\
      "#{WHITE_SQUARE} #{WHITE_KNIGHT} "\
      "#{GREEN_SQUARE} #{WHITE_ROOK} "\
      "#{NEW_LINE}"\
      "   A  B  C  D  E  F  G  H"\
      "\n"

      it 'prints starting board for standard chess' do
        expect(new_game).to receive(:print).with(printed_board)
        new_game.print_board
      end
    end

    context 'when white pawn moved to e4' do

      subject(:first_move) { described_class.new(pawn_e4) }
      let(:pawn_e4) { ["r", "n", "b", "q", "k", "b", "n", "r", "/", "p", "p", "p", "p", "p", "p", "p", "p", "/", 8, "/", 8, "/", 4, 'P', 3, "/", 8, "/", "P", "P", "P", "P", 1, "P", "P", "P", "/", "R", "N", "B", "Q", "K", "B", "N", "R"] }


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
      "4 #{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{NEW_LINE}"\
      "3 #{empty_row_white}"\
      "2 "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{NEW_LINE}"\
      "1 "\
      "#{WHITE_SQUARE} #{WHITE_ROOK} "\
      "#{GREEN_SQUARE} #{WHITE_KNIGHT} "\
      "#{WHITE_SQUARE} #{WHITE_BISHOP} "\
      "#{GREEN_SQUARE} #{WHITE_QUEEN} "\
      "#{WHITE_SQUARE} #{WHITE_KING} "\
      "#{GREEN_SQUARE} #{WHITE_BISHOP} "\
      "#{WHITE_SQUARE} #{WHITE_KNIGHT} "\
      "#{GREEN_SQUARE} #{WHITE_ROOK} "\
      "#{NEW_LINE}"\
      "   A  B  C  D  E  F  G  H"\
      "\n"

      it 'prints starting board for standard chess' do
        expect(first_move).to receive(:print).with(printed_board)
        first_move.print_board
      end
    end
  end
end

