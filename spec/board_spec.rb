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
  end
end

