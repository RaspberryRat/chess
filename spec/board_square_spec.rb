require_relative '../lib/board_square'

describe BoardSquare do
  describe '.for' do
    context 'when parity true and game piece is nil' do

      subject(:new_square) { described_class }
      let(:x) { 1 }
      let(:y) { 1 }
      let(:piece) { nil }

      it 'is GreenSquare' do
        returned_object = new_square.for(x, y, piece)
        expect(returned_object).to be_an_instance_of(GreenSquare)
      end
    end
    context 'when parity false and game piece is nil' do

      subject(:new_square) { described_class }
      let(:x) { 1 }
      let(:y) { 2 }
      let(:piece) { nil }

      it 'is WhiteSquare' do
        returned_object = new_square.for(x, y, piece)
        expect(returned_object).to be_an_instance_of(WhiteSquare)
      end
    end

    context 'when parity true and game piece is value' do

      subject(:new_square) { described_class }
      let(:x) { 1 }
      let(:y) { 1 }
      let(:piece) { 'something' }

      it 'is OccupiedGreenSquare' do
        returned_object = new_square.for(x, y, piece)
        expect(returned_object).to be_an_instance_of(OccupiedGreenSquare)
      end
    end

    context 'when parity false and game piece is nil' do

      subject(:new_square) { described_class }
      let(:x) { 1 }
      let(:y) { 2 }
      let(:piece) { 'something' }

      it 'is OccupiedWhiteSquare' do
        returned_object = new_square.for(x, y, piece)
        expect(returned_object).to be_an_instance_of(OccupiedWhiteSquare)
      end
    end
  end
end