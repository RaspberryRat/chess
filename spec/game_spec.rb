require_relative "../lib/game"

describe Game do
  describe "#player_input" do
    context "when player inputs valid input" do
      subject(:game_input) { described_class.new(board, move) }
      let(:board) { double("board") }
      let(:move) { double("move") }

      before do
        valid_input = "a1"
        allow(game_input).to receive(:gets).and_return(valid_input)
        allow(game_input).to receive(:verify_input).and_return(true)
      end

      it "returns completes loop and returns input" do
        error_message =
          "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input
      end
    end

    context "when player inputs, invalid input, then valid input" do
      subject(:game_input) { described_class.new(board, move) }
      let(:board) { double("board") }
      let(:move) { double("move") }

      before do
        invalid_input = "a9"
        valid_input = "a1"
        allow(game_input).to receive(:gets).and_return(
          invalid_input,
          valid_input
        )
        allow(game_input).to receive(:verify_input).and_return(false, true)
      end

      it "returns completes loop and returns input" do
        error_message =
          "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input
      end
    end
  end

  describe "#verify_input" do
    context "when given an input" do
      subject(:player_input) { described_class.new(board, move) }
      let(:board) { double("board") }
      let(:move) { double("move") }

      it "e4 returns true" do
        result = player_input.verify_input("e4")
        expect(result).to be(true)
      end

      it "c3 returns true" do
        result = player_input.verify_input("c3")
        expect(result).to be(true)
      end

      it "h8 returns true" do
        result = player_input.verify_input("h8")
        expect(result).to be(true)
      end

      it "a1 returns true" do
        result = player_input.verify_input("a1")
        expect(result).to be(true)
      end

      it "h9 returns false" do
        result = player_input.verify_input("h9")
        expect(result).to be(false)
      end

      it "a100 returns false" do
        result = player_input.verify_input("a100")
        expect(result).to be(false)
      end

      it "ab1 returns false" do
        result = player_input.verify_input("ab1")
        expect(result).to be(false)
      end
    end
  end

  describe "#determine_player_turn" do
    context "when game starts, current_player == player1" do
      subject(:turn_order) { described_class.new(board, move, move_list) }
      let(:board) { double("board") }
      let(:move) { double("move") }
      let(:move_list) { double("move_list") }

      before do
        allow(turn_order).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("w")

        allow(board).to receive(:board)
      end

      it "sets current_player to player1" do
        player1 = double("player1")
        current_player = double("player2")
        subject.instance_variable_set(:@player1, player1)
        subject.instance_variable_set(:@current_player, current_player)

        turn_order.determine_player_turn
        expect(subject.instance_variable_get(:@current_player)).to eq(player1)
      end
    end
  end

  # describe "#start" do
  #   subject(:move_loop) { described_class.new(board, move) }
  #   let(:board) { double("board") }
  #   let(:move) { double("move") }

  #   before do
  #     puts "setting up test"
  #     current_player = double("current_player")
  #     subject.instance_variable_set(:@player1, double("player1"))
  #     subject.instance_variable_set(:@player2, double("player2"))
  #     subject.instance_variable_set(:@current_player, current_player)
  #     allow(board).to receive(:print_board)
  #     allow(current_player).to receive(:name).and_return("current_player")
  #     other_message = "\n\nIt is #{current_player.name}'s turn\n"
  #     allow(subject).to receive(:puts).with(other_message)
  #     allow(subject).to receive(:available_moves)
  #   end

  # context "when game called with an error in player input, loops once" do
  #   before do
  #     allow(move_loop).to receive(:player_input).exactly(4).times
  #     allow(move_loop).to receive(:move_piece).and_return(false, true)
  #   end

  #   it "displays puts message twice" do
  #     message = "Select the piece you would like to move (e.g., 'a4')"
  #     expect(move_loop).to receive(:puts).with(message).twice
  #     move_loop.start
  #   end
  # end

  # context "when game called with an error in player input, loops twice" do
  #   before do
  #     allow(move_loop).to receive(:player_input).exactly(6).times
  #     allow(move_loop).to receive(:move_piece).and_return(false, false, true)
  #   end

  #   it "displays puts message twice" do
  #     message = "Select the piece you would like to move (e.g., 'a4')"
  #     expect(move_loop).to receive(:puts).with(message).exactly(3).times
  #     move_loop.start
  #   end
  # end

  #   context "when game called with a correct player input, breaks loop" do
  #     before do
  #       allow(move_loop).to receive(:player_input).exactly(2).times
  #       allow(move_loop).to receive(:move_piece).and_return(true)
  #     end

  #     it "displays puts message twice" do
  #       message = "Select the piece you would like to move (e.g., 'a4')"
  #       expect(move_loop).to receive(:puts).with(message).once
  #       move_loop.start
  #     end
  #   end
  # end
end
