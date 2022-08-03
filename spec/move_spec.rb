require_relative '../lib/move'


describe Move do
  describe '.move_loop' do
    context 'when called' do
      subject(:game_move) { described_class }
      let(:location) { 'b1' }
      let(:destination) { 'b2' }
      let(:board) { 'board' }

      it 'create new instance of Move' do
        expect(game_move).to receive(:move_loop)
        game_move.move_loop('b', 'b', 'b')
      end
    end
  end

  describe '#legal_selection?' do
    context 'when a move is legal' do
      subject(:legal_piece) { described_class.new(location, destination, board) }
      let(:board) { double('board') }
      let(:location) { 'a4' }
      let(:destination) { 'b2' }


      before do
        allow(board).to receive(:piece_at_location?).and_return(true)
      end


      it 'returns true' do
        result = legal_piece.legal_selection?
        expect(result).to be(true)
      end
    end

    context 'when there is no piece at the location' do
      subject(:illegal_selection) { described_class.new(invalid_input, destination, board) }
      let(:board) { double('board') }
      let(:invalid_input) { 'e4' }
      let(:destination) { 'b2' }


      before do
        allow(board).to receive(:piece_at_location?).and_return(false)
      end

      it 'puts error message' do
        error_message = "There is no piece at location 'e4'."
        expect(illegal_selection).to receive(:puts).with(error_message)
        illegal_selection.legal_selection?
      end

      it 'returns false' do
        result = illegal_selection.legal_selection?
        expect(result).to be(false)
        illegal_selection.legal_selection?
      end
    end
  end

  describe "#legal_move?" do

    context 'when a square is empty and a move is legal?' do

      subject(:legal_move) { described_class.new(piece, destination, board) }
      let(:board) { double('board') }
      let(:destination) { 'b3' }
      let(:piece) { 'b2' }

      before do
        allow(board).to receive(:allowed_move?).and_return(true)
      end

      it 'returns true for empty square' do
        result = legal_move.legal_move?
        expect(result).to eq(true)
      end
    end

    context 'when a illegal square is chosen for a pawn move' do

      subject(:illegal_move) { described_class.new(piece, destination, board) }
      let(:board) { double('board') }
      let(:destination) { 'b1' }
      let(:piece) { 'b2' }

      before do
        allow(board).to receive(:allowed_move?).and_return(false)
        allow(board).to receive(:allowed_move?).and_return(false, true)
      end

      it 'returns error message' do
        error_message = 'That is not a legal move, please choose a different destination.'
        expect(illegal_move).to receive(:puts).with(error_message).once
        illegal_move.legal_move?
      end
    end
  end

  describe '#piece_at_location?' do
    context 'when a piece is at selected square' do
      subject(:select_square) { described_class.new(square_picked, destination, board) }
      let(:square_picked) { 'b1' }
      let(:board) { double('board') }
      let(:destination) { 'b1' }

      before do
        allow(select_square).to receive(:what_piece).and_return('p')
      end

      it 'returns true' do
        result = select_square.piece_at_location?
        expect(result).to be(true)
      end
    end

    context 'when there is no piece at selected square' do
      subject(:select_square) { described_class.new(square_picked, destination, board) }
      let(:square_picked) { 'b3' }
      let(:board) { double('board') }
      let(:destination) { 'b1' }

      before do
        allow(select_square).to receive(:what_piece).and_return(false)
      end

      it 'returns false' do
        result = select_square.piece_at_location?
        expect(result).to be(false)
      end
    end
  end

  describe '#what_piece?' do
    context 'when a square selected' do

      subject(:pawn_selected) { described_class.new(pawn_start, destination, board) }
      let(:pawn_start) { 'b2' }
      let(:board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:destination) { 'b1' }

      it "returns 'P' for a pawn" do
        result = pawn_selected.what_piece
        expect(result).to eq('P')
      end


      subject(:first_move) { described_class.new(pawn_location, pawn_moved, updated_board) }
      let(:updated_board) { 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR' }
      let(:pawn_location) { 'e4' }
      let(:pawn_moved) { 'b1' }



      it "returns 'P' for a pawn" do
        result = first_move.what_piece
        expect(result).to eq('P')
      end
    end

  context 'when almost empty board and black king selected at c4' do

    subject(:end_game_board) { described_class.new(square_picked, destination, end_board) }
    let(:end_board) { '8/8/8/4p1K1/2k1P3/8/8/8' }
    let(:square_picked) { 'c4' }
    let(:destination) { nil }

    it "returns 'K'" do
      result = end_game_board.what_piece
      expect(result).to eq('k')
    end

    subject(:next_board) { described_class.new(empty_square, destination, end_board) }
    let(:empty_square) { 'c3' }

    it "returns 'empty square' when pick 'c3'" do
      result = next_board.what_piece
      expect(result).to be(false)
    end
  end
    
    context 'when an empty square selected' do

      subject(:empty_square_check) { described_class.new(empty_location, destination, board) }
      let(:empty_location) { 'b4' }
      let(:board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:destination) { 'b1' }

      it "returns 'empty square'" do
        result = empty_square_check.what_piece
        expect(result).to be(false)
      end
    end
  end
  
  describe '#allowed_move?' do
    context 'when a move is chosen, check if legal move' do
      subject(:pawn_move) { described_class.new(pawn, destination, starting_board, game_pieces) }
      let(:pawn) { 'b2' }
      let(:destination) { 'b3' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:game_pieces) { double('game_pieces') }

      before do
        allow(game_pieces).to receive(:moves).and_return('[1, 1], [1, 2]')
        allow(pawn_move).to receive(:move_checker?).and_return(true)
      end


      it 'returns true' do
        result = pawn_move.allowed_move?
        expect(result).to be(true)

      end
    end

    context 'when a move is chosen, check if legal move' do
      subject(:illegal_pawn_move) { described_class.new(pawn, destination, starting_board, game_pieces) }
      let(:pawn) { 'b2' }
      let(:destination) { 'b7' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:game_pieces) { double('game_pieces') }
  
      before do
        allow(game_pieces).to receive(:moves).and_return('[0, 1], [0, 2]')
        allow(illegal_pawn_move).to receive(:move_checker?).and_return(false)
      end
  
      it 'returns false' do
        result = illegal_pawn_move.allowed_move?
        expect(result).to be(false)
      end
    end
  end

  describe '#move_checker?' do
    context 'when a move is allowed' do

      
      subject(:pawn_move) { described_class.new(pawn, destination, starting_board, game_pieces) }
      let(:pawn) { 'b2' }
      let(:destination) { 'b3' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:game_pieces) { double('game_pieces') }
      let(:move_list) { [[0, 1], [0, 2]] }


      it 'returns true' do
        result = pawn_move.move_checker?(move_list)
        expect(result).to be(true)
      end
    end
  end
end
