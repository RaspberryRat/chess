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

end