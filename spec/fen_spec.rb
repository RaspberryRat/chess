require_relative '../lib/fen'

describe Fen do
  describe '#standard_chess_start' do
    context 'when standard chess starts' do

      subject(:new_game) { described_class.new }

      it 'assigns standard start poistions' do
        expect { new_game.standard_chess_start }.to change { new_game.field_placement }.to(["r", "n", "b", "q", "k", "b", "n", "r", "/", "p", "p", "p", "p", "p", "p", "p", "p", "/", 8, "/", 8, "/", 8, "/", 8, "/", "P", "P", "P", "P", "P", "P", "P", "P", "/", "R", "N", "B", "Q", "K", "B", "N", "R"])

      end
    end
  end

  describe '#update_field' do
    context 'when given starting notation' do
      subject(:fresh_game) { described_class.new }
      let(:starting_position) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' } 

      it 'returns an array of starting notation' do
        field_positions = fresh_game.update_field(starting_position)
        expect(field_positions).to eq(["r", "n", "b", "q", "k", "b", "n", "r", "/", "p", "p", "p", "p", "p", "p", "p", "p", "/", 8, "/", 8, "/", 8, "/", 8, "/", "P", "P", "P", "P", "P", "P", "P", "P", "/", "R", "N", "B", "Q", "K", "B", "N", "R"])
      end
    end
  end
end