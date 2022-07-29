require_relative '../lib/fen'

describe Fen do
  describe '#standard_chess_start' do
    context 'when standard chess starts' do

      subject(:new_game) { described_class.new }

      it 'assigns standard start poistions' do
        expect { new_game.standard_chess_start }.to change { new_game.field_placement }.to('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR')

      end
    end
  end
end