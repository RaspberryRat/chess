require_relative '../lib/checkmate'

describe Checkmate do
  describe "checkmate?" do
    context 'when checkmate' do
      subject(:check_mate) { described_class.new(board) }
      let(:board) { "7k/7R/5N2/8/8/8/8/6K1 b" }

      it 'returns true' do
        result = check_mate.checkmate?
        expect(result).to be(true)
      end
    end

    context 'when not checkmate' do
      subject(:check_mate) { described_class.new(board) }
      let(:board) { "rnbqkbnr/pppp1ppp/8/4p3/8/P7/1PPPPPPP/RNBQK1NR w KQkq" }

      it 'returns false' do
        result = check_mate.checkmate?
        expect(result).to be(false)
      end
    end

    context 'when king in check, not checkmate' do
      subject(:king_check_position) { described_class.new(board) }
      let(:board) { '8/8/8/8/8/8/8/K6q w' }
      it 'returns false' do
        result = king_check_position.checkmate?
        expect(result).to be(false)
      end
    end
  end
end
