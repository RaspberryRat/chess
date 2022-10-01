require_relative '../lib/available_moves'

describe AvailableMoves do
  describe '#available_moves' do

    context 'when queen is selected at starting location' do

      subject(:new_game) { described_class.new(queen, starting_board, piece) }
      let(:queen) { 'd1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:piece) { 'Q' }
      let(:queen_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      it 'returns no possible moves' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to be(false)
      end
    end

    context 'when queen is selected at starting location and pawn moved d2d3' do

      subject(:new_game) { described_class.new(queen, starting_board, piece) }
      let(:queen) { 'd1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/3P4/PPP1PPPP/RNBQKBNR' }
      let(:piece) { 'Q' }
      let(:queen_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      expected_moves = [[1, 0]]

      it 'returns one possible move' do
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when queen is selected at start location and pawn removed in d' do

      subject(:new_game) { described_class.new(queen, starting_board, piece) }
      let(:queen) { 'd1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPP1PPPP/RNBQKBNR' }
      let(:piece) { 'Q' }
      let(:queen_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      expected_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0]]

      it 'returns 6 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when queen is selected at start location and pawn removed in d' do

      subject(:new_game) { described_class.new(queen, starting_board, piece) }
      let(:queen) { 'd1' }
      let(:starting_board) { 'rnbqkbnr/8/8/8/8/8/PPP1PPPP/RNBQKBNR' }
      let(:piece) { 'Q' }
      let(:queen_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      expected_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]

      it 'returns 7 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when queen is selected at and only piece in row' do

      subject(:new_game) { described_class.new(queen, starting_board, piece) }
      let(:queen) { 'd1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/3Q4' }
      let(:piece) { 'Q' }
      let(:queen_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      expected_moves = [[0, 1], [0, -1], [0, 2], [0, -2], [0, 3], [0, -3], [0, 4]]

      it 'returns 7 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when queen is selected at and no pawns in row 2' do

      subject(:new_game) { described_class.new(queen, starting_board, piece) }
      let(:queen) { 'd1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/8/RNBQKBNR' }
      let(:piece) { 'Q' }
      let(:queen_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      expected_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [1, -1], [2, -2], [3, -3], [1, 1], [2, 2], [3, 3], [4, 4]]

      it 'returns 7 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when rook is selected at starting location' do

      subject(:new_game) { described_class.new(rook, starting_board, piece) }
      let(:rook) { 'a1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:piece) { 'R' }
      let(:rook_moves) { [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

      it 'returns no possible moves' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to be(false)
      end
    end

    context 'when rook is selected at starting location and pawn moved a2da3' do

        subject(:new_game) { described_class.new(rook, starting_board, piece) }
        let(:rook) { 'a1' }
        let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/P7/1PPPPPPP/RNBQKBNR' }
        let(:piece) { 'R' }
        let(:rook_moves) { [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

        expected_moves = [[1, 0]]
      
        it 'returns one possible move' do
          moves_available = new_game.possible_moves
          expect(moves_available).to match_array(expected_moves)
        end
      end
      
  context 'when rook is selected at start location and pawn removed in a' do
  
    subject(:new_game) { described_class.new(rook, starting_board, piece) }
    let(:rook) { 'a1' }
    let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/1PPPPPPP/RNBQKBNR' }
    let(:piece) { 'R' }
    let(:rook_moves) { [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }
  
    expected_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0]]
  
    it 'returns 6 possible move' do
      moves_available = new_game.possible_moves
      expect(moves_available).to match_array(expected_moves)
    end
  end
  
  context 'when rook is selected at start and all pawns removed in a' do
  
    subject(:new_game) { described_class.new(rook, starting_board, piece) }
    let(:rook) { 'a1' }
    let(:starting_board) { 'rnbqkbnr/8/8/8/8/8/1PPPPPPP/RNBQKBNR' }
    let(:piece) { 'R' }
    let(:rook_moves) { [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

    expected_moves = [[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0]]

    it 'returns 7 possible move' do 
      moves_available = new_game.possible_moves
      expect(moves_available).to match_array(expected_moves)
    end
  end
  
  context 'when rook is selected at and only piece in row' do
  
    subject(:new_game) { described_class.new(rook, starting_board, piece) }
    let(:rook) { 'a1' }
    let(:starting_board) { 'rnbqkbnr/8/8/8/8/8/PPPPPPPP/R7' }
    let(:piece) { 'R' }
    let(:rook_moves) { [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }
  
    expected_moves = [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
  
    it 'returns 7 possible move' do 
      moves_available = new_game.possible_moves
      expect(moves_available).to match_array(expected_moves)
    end
  end

  context 'when rook in h is selected at and only piece in row' do
  
    subject(:new_game) { described_class.new(rook, starting_board, piece) }
    let(:rook) { 'h1' }
    let(:starting_board) { 'rnbqkbnr/8/8/8/8/8/PPPPPPPP/7R' }
    let(:piece) { 'R' }
    let(:rook_moves) { [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7], [-1, 0], [-2, 0], [-3, 0], [-4, 0], [-5, 0], [-6, 0], [-7, 0]] }

    expected_moves = [[0, -1], [0, -2], [0, -3], [0, -4], [0, -5], [0, -6], [0, -7]]

    it 'returns 7 possible move' do 
      moves_available = new_game.possible_moves
      expect(moves_available).to match_array(expected_moves)
    end
  end

  context 'when bishop is selected at starting location' do

    subject(:new_game) { described_class.new(bishop, starting_board, piece) }
    let(:bishop) { 'c1' }
    let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
    let(:piece) { 'B' }
    let(:bishop_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]] }

    it 'returns no possible moves' do 
      moves_available = new_game.possible_moves
      expect(moves_available).to be(false)
    end
  end
  
  context 'when bishop is selected at start location and pawn moved d2d3' do

    subject(:new_game) { described_class.new(bishop, starting_board, piece) }
    let(:bishop) { 'c1' }
    let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/3P4/PPP1PPPP/RNBQKBNR' }
    let(:piece) { 'B' }
    let(:bishop_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]] }

      expected_moves = [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5]]

      it 'returns one possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when f bishop is selected at start location and pawn moved e2e3' do

      subject(:new_game) { described_class.new(bishop, starting_board, piece) }
      let(:bishop) { 'f1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/4P3/PPPP1PPP/RNBQKBNR' }
      let(:piece) { 'B' }
      let(:bishop_moves) { [[1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7], [1, -1], [2, -2], [3, -3], [4, -4], [5, -5], [6, -6], [7, -7], [-1, -1], [-2, -2], [-3, -3], [-4, -4], [-5, -5], [-6, -6], [-7, -7]] }

      expected_moves = [[1, -1], [2, -2], [3, -3], [4, -4], [5, -5]]

      it 'returns one possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when king is selected at starting location' do

      subject(:new_game) { described_class.new(king, starting_board, piece) }
      let(:king) { 'e1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:piece) { 'K' }
      let(:king_moves) { [[1, 1], [-1, 1], [1, -1], [-1, -1], [0, 1], [1, 0], [0, -1], [-1, 0]] }

      

      it 'returns no possible moves' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to be(false)
      end
    end

    context 'when king is selected at starting location and pawn moved e2e3' do

      subject(:new_game) { described_class.new(king, starting_board, piece) }
      let(:king) { 'e1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/4P3/PPPP1PPP/RNBQKBNR' }
      let(:piece) { 'K' }
      let(:king_moves) { [[1, 1], [-1, 1], [1, -1], [-1, -1], [0, 1], [1, 0], [0, -1], [-1, 0]] }

      expected_moves = [[1, 0]]
  
      it 'returns one possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end
    
    context 'when king is selected at start location and pawn removed in e' do

      subject(:new_game) { described_class.new(king, starting_board, piece) }
      let(:king) { 'e1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPP1PPP/RNBQKBNR' }
      let(:piece) { 'K' }
      let(:king_moves) { [[1, 1], [-1, 1], [1, -1], [-1, -1], [0, 1], [1, 0], [0, -1], [-1, 0]] }
    
      expected_moves = [[1, 0]]
    
      it 'returns 1 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end
    
    
    context 'when king is selected at and only piece in row' do
    
      subject(:new_game) { described_class.new(king, starting_board, piece) }
      let(:king) { 'e1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/4K3' }
      let(:piece) { 'K' }
      let(:king_moves) { [[1, 1], [-1, 1], [1, -1], [-1, -1], [0, 1], [1, 0], [0, -1], [-1, 0]] }
    
      expected_moves = [[0, 1], [0, -1]]
    
      it 'returns 2 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end
    
    context 'when king is selected at and no pawns in row 2' do
    
      subject(:new_game) { described_class.new(king, starting_board, piece) }
      let(:king) { 'e1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/8/RNBQKBNR' }
      let(:piece) { 'K' }
      let(:king_moves) { [[1, 1], [-1, 1], [1, -1], [-1, -1], [0, 1], [1, 0], [0, -1], [-1, 0]] }
    
      expected_moves = [[1, 0], [1, -1], [1, 1]]
    
      it 'returns 3 possible move' do 
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when knight is selected at starting location' do

      subject(:new_game) { described_class.new(knight, starting_board, piece) }
      let(:knight) { 'b1' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:piece) { 'N' }
      let(:knight_moves) { [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]] }
      
      expected_moves = [[2, 1], [2, -1]]

      it 'returns two possible moves' do
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when knight is only piece on board at starting location' do

      subject(:new_game) { described_class.new(knight, starting_board, piece) }
      let(:knight) { 'b1' }
      let(:starting_board) { '8/8/8/8/8/8/8/1N7' }
      let(:piece) { 'N' }
      let(:knight_moves) { [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]] }
      
      expected_moves = [[2, 1], [2, -1], [1, 2]]

      it 'returns three possible moves' do
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when knight is at location d4, pawns in row 2, 3, 5, 6' do

      subject(:new_game) { described_class.new(knight, starting_board, piece) }
      let(:knight) { 'd4' }
      let(:starting_board) { '8/8/pppppppp/pppppppp/3N4/pppppppp/pppppppp/8' }
      let(:piece) { 'N' }
      let(:knight_moves) { [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]] }
      
      expected_moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

      it 'returns eight possible moves' do
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end

    context 'when knight is at location d4 and white pawns in row 2, 3, 5, 6' do

      subject(:new_game) { described_class.new(knight, starting_board, piece) }
      let(:knight) { 'd4' }
      let(:starting_board) { '8/8/PPPPPPPP/PPPPPPPP/3N4/PPPPPPPP/PPPPPPPP/8' }
      let(:piece) { 'N' }
      let(:knight_moves) { [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]] }

      it 'returns eight possible moves' do
        moves_available = new_game.possible_moves
        expect(moves_available).to be(false)
      end
    end

    context 'when pawn is has a piece to capture' do

      subject(:new_game) { described_class.new(pawn, starting_board, piece) }
      let(:pawn) { 'd2' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/pppppppp/PPPPPPPP/RNBQKBNR' }
      let(:piece) { 'P' }
      let(:pawn_moves) { [[0, 1], [0, 2], [1, -1], [1, 1]] }

      expected_moves = [[1, 1], [1, -1]]

      it 'returns two possible moves' do
        moves_available = new_game.possible_moves
        expect(moves_available).to match_array(expected_moves)
      end
    end
  end
end