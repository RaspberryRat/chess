require_relative '../lib/board_square'

describe BoardSquare do
  describe '.for' do
    context 'when parity true and game piece is nil' do

      subject(:new_square) { described_class }
      let(:argument_hash) { {x_position: 1, y_position: 1, game_piece: nil} }

  
      it 'is GreenSquare' do
        returned_object = new_square.for(argument_hash)
        expect(returned_object).to be_an_instance_of(GreenSquare)
      end
    end
    context 'when parity false and game piece is nil' do

      subject(:new_square) { described_class }
      let(:argument_hash) { {x_position: 1, y_position: 2, game_piece: nil} }

      it 'is WhiteSquare' do
        returned_object = new_square.for(argument_hash)
        expect(returned_object).to be_an_instance_of(WhiteSquare)
      end
    end

    context 'when parity true and game piece is value' do

      subject(:new_square) { described_class }
      let(:argument_hash) { {x_position: 1, y_position: 1, game_piece: 'something'} } 


      it 'is OccupiedGreenSquare' do
        returned_object = new_square.for(argument_hash)
        expect(returned_object).to be_an_instance_of(OccupiedGreenSquare)
      end
    end

    context 'when parity false and game piece is nil' do

      subject(:new_square) { described_class }
      let(:argument_hash) { {x_position: 1, y_position: 2, game_piece: 'something'} } 


      it 'is OccupiedWhiteSquare' do
        returned_object = new_square.for(argument_hash)
        expect(returned_object).to be_an_instance_of(OccupiedWhiteSquare)
      end
    end
  end
end