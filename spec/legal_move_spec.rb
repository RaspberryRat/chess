require_relative '../lib/legal_move'

describe LegalMove do
  describe '#piece_colour' do
    context 'when a white queen is selected' do
      subject(:game_move) { described_class.new(empty, empty, empty, empty) }
      let(:empty) { 'nil' }
      let(:piece) { 'Q' }

      it "returns 'white'" do
        colour = game_move.piece_colour(piece)
        expect(colour).to eq('white')
      end
    end
  end
end