require_relative '../lib/check'

describe Check do
  describe "#king_in_check" do
    context 'when king in check' do
      subject(:king_check_position) { described_class.new(board) }
      let(:board) { '8/8/8/8/8/8/8/K6q w' }
      it 'returns true' do
        result = king_check_position.king_in_check?
        expect(result).to be(true)
      end
    end

    context 'when king not in check' do
      subject(:king_check_position) { described_class.new(board) }
      let(:board) { '6q1/8/8/8/8/8/8/K7 w' }
      it 'returns false' do
        result = king_check_position.king_in_check?
        expect(result).to be(false)
      end
    end

    context 'when king in check' do
      subject(:king_check_position) { described_class.new(board) }
      let(:board) { '6q1/8/8/8/8/8/2n5/K7 w' }
      it 'returns false' do
        result = king_check_position.king_in_check?
        expect(result).to be(true)
      end
    end
  end
end
