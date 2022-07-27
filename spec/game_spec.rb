require_relative '../lib/game'

describe Game do
  describe '#start' do
    subject(:new_game) { described_class.new }
    let(:game_piece_array) { Array.new(32) }

    context 'when new game is started' do
      before do
        allow(new_game).to receive(:create_pieces).and_return(game_piece_array)
      end
      it 'creates 32 game pieces' do
        game_pieces = new_game.start
        expect(game_pieces.length).to be(32)
      end
    end
  end

  describe '#create_pieces' do
    subject(:new_game) { described_class.new }
    let(:return_array) { Array.new(32) }

    context 'when new game is start' do

      before do
        pieces_class = class_double('GamePiece')
        allow(new_game).to receive(:next_piece).and_return('an object')
      end
      it 'returns an array with 32 pieces' do
        game_piece_array = new_game.create_pieces
        expect(game_piece_array.length).to be(32)
      end
    end
  end
end