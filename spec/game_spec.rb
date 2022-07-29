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
        expect(game_piece_array.length).to be(32)
        new_game.start
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

  describe '#assign_start_location' do
    subject(:new_game) { described_class.new(game_piece_array) }
    let(:game_piece_array) { [pawn1] }
    let(:pawn1) { double('pawn1', location: nil) }

    context 'when a new game is started' do
      it 'a white pawn will be at [1, 1]' do
        expect { new_game.assign_start_location }.to change { pawn1.location }.to([1, 1])

      end
    end
  end
end