require_relative '../lib/move'


describe Move do

end








describe '#legal_selection?' do
  #   context 'when a move is legal' do
  #     subject(:legal_piece) { described_class.new(board) }
  #     let(:board) { double('board') }
  #     let(:valid_input) { 'a4' }

  #     before do
  #       allow(board).to receive(:piece_at_location?).and_return(true)
  #     end


  #     it 'returns true' do 
  #       result = legal_piece.legal_selection?(valid_input)
  #       expect(result).to be(true)
  #     end
  #   end

  #   context 'when there is no piece at the location' do
  #     subject(:illegal_selection) { described_class.new(board) }
  #     let(:board) { double('board') }
  #     let(:invalid_input) { 'e4' }

  #     before do
  #       allow(board).to receive(:piece_at_location?).and_return(nil)
  #     end

  #     it 'puts error message' do
  #       allow(illegal_selection).to receive(:start)
  #       error_message = "There is no piece at location 'e4'."
  #       expect(illegal_selection).to receive(:puts).with(error_message)
  #       illegal_selection.legal_selection?(invalid_input)
  #     end

  #     it 'expect #start to be received' do
  #       expect(illegal_selection).to receive(:start).once
  #       illegal_selection.legal_selection?(invalid_input)
  #     end
  #   end
  # end

  # describe "#legal_move?" do

  #   context 'when a square is empty and a move is legal?' do

  #     subject(:legal_move) { described_class.new(board) }
  #     let(:board) { double('board') }
  #     let(:move) { 'b3' }
  #     let(:piece) { 'b2' }

  #     before do
  #       allow(board).to receive(:allowed_move?).and_return(true)
  #       allow(board).to receive(:legal_move?).and_return(true)
  #     end

  #     it 'returns true for empty square' do
  #       result = legal_move.legal_move?(piece, move)
  #       expect(result).to eq(true)
  #     end
  #   end

  #   context 'when a illegal square is chosen for a pawn move' do

  #     subject(:illegal_move) { described_class.new(board) }
  #     let(:board) { double('board') }
  #     let(:move) { 'b1' }
  #     let(:piece) { 'b2' }

  #     before do
  #       move_message = 'What square do you want to move to?'
  #       allow(board).to receive(:allowed_move?).and_return(false)
  #       allow(illegal_move).to receive(:puts).with(move_message)
  #       allow(illegal_move).to receive(:player_input)
  #       allow(board).to receive(:allowed_move?).and_return(false, true)
  #     end

  #     it 'returns error message' do
  #       error_message = 'That is not a legal move, please choose a different destination.'
  #       expect(illegal_move).to receive(:puts).with(error_message).once
  #       illegal_move.legal_move?(piece, move)
  #     end
  #   end

  #   context 'when a illegal move is chosen then a legal move for a pawn move' do

  #     subject(:game_move) { described_class.new(board) }
  #     let(:board) { double('board') }
  #     let(:invalid_move) { 'b1' }
  #     let(:piece) { 'b2' }


  #     before do
  #       invalid_move = 'b1'
  #       valid_move = 'b3'
  #       allow(board).to receive(:allowed_move?).and_return(false, true)
  #       allow(board).to receive(:legal_move?).and_return(nil, true)
  #     end

  #     it 'returns nil then true' do
  #       expect(game_move).to receive(:move_loop).once
  #       game_move.legal_move?(piece, invalid_move)
  #     end
  #   end
  # end