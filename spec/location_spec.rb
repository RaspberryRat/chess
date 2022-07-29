require_relative '../lib/location'

describe Location do
  describe '#update_location' do
    context 'when a new game of chess start' do
      subject(:new_game) { described_class.new }
      let(:pawn) { double('pawn', location: nil)}

      it 'white pawn in [2, 1]' do
        expect { new_game.standard_chess_start(pawn) }.to  change { pawn.location }.to([2, 1])
      end
    end
  end
end