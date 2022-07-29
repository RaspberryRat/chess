require_relative '../lib/fen'

describe Fen do
  describe '.piece_placement' do
    context 'when standard chess starts' do

      subject(:new_game) { described_class }
      starting_notation = ["r", "n", "b", "q", "k", "b", "n", "r", "/", "p", "p", "p", "p", "p", "p", "p", "p", "/", 8, "/", 8, "/", 8, "/", 8, "/", "P", "P", "P", "P", "P", "P", "P", "P", "/", "R", "N", "B", "Q", "K", "B", "N", "R"]
      it 'assigns standard start poistions' do
        notation = new_game.piece_placement
        expect(notation).to eq(starting_notation)
      
      end
    end
  end

end

describe FenToArray do
  describe '#update_field' do
    context 'when given starting notation' do
      subject(:fresh_game) { described_class.new(starting_position) }
      let(:starting_position) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' } 

      it 'returns an array of starting notation' do
        field_positions = fresh_game.update_field
        expect(field_positions).to eq(["r", "n", "b", "q", "k", "b", "n", "r", "/", "p", "p", "p", "p", "p", "p", "p", "p", "/", 8, "/", 8, "/", 8, "/", 8, "/", "P", "P", "P", "P", "P", "P", "P", "P", "/", "R", "N", "B", "Q", "K", "B", "N", "R"])
      end
    end
  end
end