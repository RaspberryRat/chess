require_relative '../lib/game_pieces'

describe GamePiece do
  describe '.for' do

    context 'when method calls return correct game piece' do
      subject(:new_game) { described_class }

      it 'returns white rook' do
        choice = :R
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Rook)
      end

      it 'returns white knight' do
        choice = :N
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Knight)
      end

      it 'returns white bishop' do
        choice = :B
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Bishop)
      end

      it 'returns white queen' do
        choice = :Q
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Queen)
      end

      it 'returns white king' do
        choice = :K
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(King)
      end

      it 'returns white bishop' do
        choice = :B
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Bishop)
      end

      it 'returns white knight' do
        choice = :N
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Knight)
      end

      it 'returns white rook' do
        choice = :R
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Rook)
      end

      it 'returns a white pawn' do
        choice = :P
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns black rook' do
        choice = :r
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackRook)
      end
      
      it 'returns black knight' do
        choice = :n
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackKnight)
      end
      
      it 'returns black bishop' do
        choice = :b
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackBishop)
      end
      
      it 'returns black queen' do
        choice = :q
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackQueen)
      end
      
      it 'returns black king' do
        choice = :k
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackKing)
      end
      
      it 'returns black bishop' do
        choice = :b
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackBishop)
      end
      
      it 'returns black knight' do
        choice = :n
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackKnight)
      end
      
      it 'returns black rook' do
        choice = :r
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackRook)
      end

      it 'returns a black pawn' do
        choice = :p
        returned_object = new_game.for(choice)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end
    end
  end

  describe '.moves' do
    context 'when a white pawn piece is called' do

      subject(:pawn_class) { described_class }
      let(:class_symbol) { :P }

      expected_moves = [[0, 1], [0, 2], [-1, 1], [1, 1]]

      it 'returns white pawn move list' do
        move_list = pawn_class.moves(class_symbol)
        expect(move_list).to eq(expected_moves)
      end
    end
  end

  context 'when a black pawn piece is called' do
    subject(:pawn_class) { described_class }
    let(:class_symbol) { :p }

    expected_moves = [[0, -1], [0, -2], [-1, -1], [1, -1]]

    it 'returns black pawn move list' do
      move_list = pawn_class.moves(class_symbol)
      expect(move_list).to eq(expected_moves)
    end
  end

  context 'when a white rook piece is called' do

    subject(:rook_class) { described_class }
    let(:class_symbol) { :R }

    expected_moves = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]

    it 'returns white rook move list' do
      move_list = rook_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a black rook piece is called' do
    subject(:rook_class) { described_class }
    let(:class_symbol) { :r }

    expected_moves = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]

    it 'returns black rook move list' do
      move_list = rook_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a white knight piece is called' do

    subject(:knight_class) { described_class }
    let(:class_symbol) { :N }

    expected_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    it 'returns white knight move list' do
      move_list = knight_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a black knight piece is called' do
    subject(:knight_class) { described_class }
    let(:class_symbol) { :n }

    expected_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    it 'returns black knight move list' do
      move_list = knight_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a white bishop piece is called' do

    subject(:bishop_class) { described_class }
    let(:class_symbol) { :B }

    expected_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]

    it 'returns white bishop move list' do
      move_list = bishop_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a black bishop piece is called' do
    subject(:bishop_class) { described_class }
    let(:class_symbol) { :b }

    expected_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]]

    it 'returns black bishop move list' do
      move_list = bishop_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a white queen piece is called' do

    subject(:queen_class) { described_class }
    let(:class_symbol) { :Q }

    expected_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]

    it 'returns white queen move list' do
      move_list = queen_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a black queen piece is called' do
    subject(:queen_class) { described_class }
    let(:class_symbol) { :q }

    expected_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]]

    it 'returns black queen move list' do
      move_list = queen_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a white king piece is called' do

    subject(:king_class) { described_class }
    let(:class_symbol) { :K }

    expected_moves = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]

    it 'returns white king move list' do
      move_list = king_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end

  context 'when a black king piece is called' do
    subject(:king_class) { described_class }
    let(:class_symbol) { :k }

    expected_moves = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]

    it 'returns black king move list' do
      move_list = king_class.moves(class_symbol)
      expect(move_list).to match_array(expected_moves)
    end
  end
end
