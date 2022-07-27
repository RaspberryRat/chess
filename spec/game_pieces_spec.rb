require_relative '../lib/game_pieces'

describe GamePiece do
  describe '.for' do

    context 'when method calls return correct game piece' do
      subject(:new_game) { described_class }

      it 'returns white rook when count is 1' do
        returned_object = new_game.for(1)
        expect(returned_object).to be_an_instance_of(Rook)
      end

      it 'returns white knight when count is 2' do
        returned_object = new_game.for(2)
        expect(returned_object).to be_an_instance_of(Knight)
      end

      it 'returns white bishop when count is 3' do
        returned_object = new_game.for(3)
        expect(returned_object).to be_an_instance_of(Bishop)
      end

      it 'returns white queen when count is 4' do
        returned_object = new_game.for(4)
        expect(returned_object).to be_an_instance_of(Queen)
      end

      it 'returns white king when count is 5' do
        returned_object = new_game.for(5)
        expect(returned_object).to be_an_instance_of(King)
      end

      it 'returns white bishop when count is 6' do
        returned_object = new_game.for(6)
        expect(returned_object).to be_an_instance_of(Bishop)
      end

      it 'returns white knight when count is 7' do
        returned_object = new_game.for(7)
        expect(returned_object).to be_an_instance_of(Knight)
      end

      it 'returns white rook when count is 8' do
        returned_object = new_game.for(8)
        expect(returned_object).to be_an_instance_of(Rook)
      end

      it 'returns a white pawn when count is 9' do
        returned_object = new_game.for(9)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns a white pawn when count is 12' do
        returned_object = new_game.for(12)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns a white pawn when count is 16' do
        returned_object = new_game.for(16)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns black rook when count is 17' do
        returned_object = new_game.for(17)
        expect(returned_object).to be_an_instance_of(BlackRook)
      end
      
      it 'returns black knight when count is 18' do
        returned_object = new_game.for(18)
        expect(returned_object).to be_an_instance_of(BlackKnight)
      end
      
      it 'returns black bishop when count is 19' do
        returned_object = new_game.for(19)
        expect(returned_object).to be_an_instance_of(BlackBishop)
      end
      
      it 'returns black queen when count is 20' do
        returned_object = new_game.for(20)
        expect(returned_object).to be_an_instance_of(BlackQueen)
      end
      
      it 'returns black king when count is 21' do
        returned_object = new_game.for(21)
        expect(returned_object).to be_an_instance_of(BlackKing)
      end
      
      it 'returns black bishop when count is 22' do
        returned_object = new_game.for(22)
        expect(returned_object).to be_an_instance_of(BlackBishop)
      end
      
      it 'returns black knight when count is 23' do
        returned_object = new_game.for(23)
        expect(returned_object).to be_an_instance_of(BlackKnight)
      end
      
      it 'returns black rook when count is 24' do
        returned_object = new_game.for(24)
        expect(returned_object).to be_an_instance_of(BlackRook)
      end

      it 'returns a black pawn when count is 25' do
        returned_object = new_game.for(25)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end

      it 'returns a black pawn when count is 28' do
        returned_object = new_game.for(28)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end

      it 'returns a black pawn when count is 32' do
        returned_object = new_game.for(32)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end
    end
  end
  
end