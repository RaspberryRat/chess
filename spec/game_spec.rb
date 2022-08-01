require_relative '../lib/game'

describe Game do
  describe '#player_input' do
    context 'when player inputs valid input' do

      subject(:game_input) { described_class.new }


      before do
        valid_input = 'a1'
        allow(game_input).to receive(:gets).and_return(valid_input)
        allow(game_input).to receive(:verify_input).and_return(true)
      end

      it 'returns completes loop and returns input' do
        error_message = "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input
      end
    end

    context 'when player inputs, invalid input, then valid input' do

      subject(:game_input) { described_class.new }
      before do
        invalid_input = 'a9'
        valid_input = 'a1'
        allow(game_input).to receive(:gets).and_return(invalid_input, valid_input)
        allow(game_input).to receive(:verify_input).and_return(false, true)
      end

      it 'returns completes loop and returns input' do
        error_message = "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end
  end

  describe '#verify_input' do
    context 'when given an input' do
      subject(:player_input) { described_class.new }

      it 'e4 returns true' do
        result = player_input.verify_input('e4')
        expect(result).to be(true)
      end

      it 'c3 returns true' do
        result = player_input.verify_input('c3')
        expect(result).to be(true)
      end

      it 'h8 returns true' do
        result = player_input.verify_input('h8')
        expect(result).to be(true)
      end

      it 'a1 returns true' do
        result = player_input.verify_input('a1')
        expect(result).to be(true)
      end

      it 'h9 returns false' do
        result = player_input.verify_input('h9')
        expect(result).to be(false)
      end

      it 'a100 returns false' do
        result = player_input.verify_input('a100')
        expect(result).to be(false)
      end

      it 'ab1 returns false' do
        result = player_input.verify_input('ab1')
        expect(result).to be(false)
      end
    end
  end

  describe '#legal_selection?' do
    context 'when a move is legal' do
      subject(:legal_piece) { described_class.new(board) }
      let(:board) { double('board') }
      let(:valid_input) { 'a4' }

      before do
        allow(board).to receive(:piece_at_location?).and_return(true)
      end


      it 'returns true' do 
        result = legal_piece.legal_selection?(valid_input)
        expect(result).to be(true)
      end
    end

    context 'when there is no piece at the location' do
      subject(:illegal_selection) { described_class.new(board) }
      let(:board) { double('board') }
      let(:invalid_input) { 'e4' }

      before do
        allow(board).to receive(:piece_at_location?).and_return(false)
      end

      it 'puts error message' do
        allow(illegal_selection).to receive(:start)
        error_message = "There is no piece at location 'e4'."
        expect(illegal_selection).to receive(:puts).with(error_message)
        illegal_selection.legal_selection?(invalid_input)
      end

      it 'expect #start to be received' do
        expect(illegal_selection).to receive(:start).once
        illegal_selection.legal_selection?(invalid_input)
      end
    end
  end
end
