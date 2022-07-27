require_relative '../lib/game'

describe Game do
  describe "#start" do
    subject(:new_game) { described_class.new }
    let(:game_piece_array) { Array.new(24) }

    context 'when new game is started' do
      before do
        allow(new_game).to receive(:create_pieces).and_return(game_piece_array)
      end
      it 'creates 24 game pieces' do
        game_pieces = new_game.start
        expect(game_pieces.length).to be(24)
      end
    end
  end

end