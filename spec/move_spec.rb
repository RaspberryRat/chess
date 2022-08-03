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
end
