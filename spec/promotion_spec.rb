require_relative "../lib/promotion"

describe Promotion do
  describe "#promoted" do
    context "when a white pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/P7/8/8/8/8/8/8" }
      let(:new_board) { "P7/8/8/8/8/8/8/8" }
      let(:location) { "a7" }
      let(:destination) { "a8" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("w")
        allow(pawn_promotion).to receive(:promoted_piece).and_return("Q")
      end

      it "returns a board where pawn equals queen" do
        result = pawn_promotion.promoted
        expect(result).to eq("Q7/8/8/8/8/8/8/8")
      end
    end

    context "when a black pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/8/8/8/8/8/p7/8" }
      let(:new_board) { "8/8/8/8/8/8/8/p7" }
      let(:location) { "a2" }
      let(:destination) { "a1" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("b")
        allow(pawn_promotion).to receive(:promoted_piece).and_return("q")
      end

      it "returns a board where pawn equals queen" do
        result = pawn_promotion.promoted
        expect(result).to eq("8/8/8/8/8/8/8/q7")
      end
    end

    context "when a no pawn enters last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/8/8/8/8/1p6/p7/8" }
      let(:new_board) { "8/8/8/8/8/8/pp6/8" }
      let(:location) { "b3" }
      let(:destination) { "b2" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("b")
        allow(pawn_promotion).to receive(:promoted_piece).and_return("q")
      end

      it "returns a board where pawn equals queen" do
        result = pawn_promotion.promoted
        expect(result).to eq(new_board)
      end
    end

    context "when a white pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/P7/8/8/8/8/8/8" }
      let(:new_board) { "P7/8/8/8/8/8/8/8" }
      let(:location) { "a7" }
      let(:destination) { "a8" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("w")
        allow(pawn_promotion).to receive(:player_input).and_return(1)
      end

      it "returns a board where pawn equals queen" do
        result = pawn_promotion.promoted
        expect(result).to eq("Q7/8/8/8/8/8/8/8")
      end
    end

    context "when a white pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/P7/8/8/8/8/8/8" }
      let(:new_board) { "P7/8/8/8/8/8/8/8" }
      let(:location) { "a7" }
      let(:destination) { "a8" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("w")
        allow(pawn_promotion).to receive(:player_input).and_return(2)
      end

      it "returns a board where pawn equals bishop" do
        result = pawn_promotion.promoted
        expect(result).to eq("B7/8/8/8/8/8/8/8")
      end
    end

    context "when a white pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/P7/8/8/8/8/8/8" }
      let(:new_board) { "P7/8/8/8/8/8/8/8" }
      let(:location) { "a7" }
      let(:destination) { "a8" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("w")
        allow(pawn_promotion).to receive(:player_input).and_return(3)
      end

      it "returns a board where pawn equals knight" do
        result = pawn_promotion.promoted
        expect(result).to eq("N7/8/8/8/8/8/8/8")
      end
    end

    context "when a white pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "8/P7/8/8/8/8/8/8" }
      let(:new_board) { "P7/8/8/8/8/8/8/8" }
      let(:location) { "a7" }
      let(:destination) { "a8" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("w")
        allow(pawn_promotion).to receive(:player_input).and_return(4)
      end

      it "returns a board where pawn equals rook" do
        result = pawn_promotion.promoted
        expect(result).to eq("R7/8/8/8/8/8/8/8")
      end
    end

    context "when a black pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "3k4/6P1/8/8/8/8/7p/3K4" }
      let(:new_board) { "3k4/6P1/8/8/8/8/8/3K3p" }
      let(:location) { "h2" }
      let(:destination) { "h1" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("b")
        allow(pawn_promotion).to receive(:player_input).and_return(1)
      end

      it "returns a board where pawn equals queen" do
        result = pawn_promotion.promoted
        expect(result).to eq("3k4/6P1/8/8/8/8/8/3K3q")
      end
    end

    context "when a black pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "3k4/6P1/8/8/8/8/7p/3K4" }
      let(:new_board) { "3k4/6P1/8/8/8/8/8/3K3p" }
      let(:location) { "h2" }
      let(:destination) { "h1" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("b")
        allow(pawn_promotion).to receive(:player_input).and_return(2)
      end

      it "returns a board where pawn equals bishop" do
        result = pawn_promotion.promoted
        expect(result).to eq("3k4/6P1/8/8/8/8/8/3K3b")
      end
    end

    context "when a black pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "3k4/6P1/8/8/8/8/7p/3K4" }
      let(:new_board) { "3k4/6P1/8/8/8/8/8/3K3p" }
      let(:location) { "h2" }
      let(:destination) { "h1" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("b")
        allow(pawn_promotion).to receive(:player_input).and_return(3)
      end

      it "returns a board where pawn equals knight" do
        result = pawn_promotion.promoted
        expect(result).to eq("3k4/6P1/8/8/8/8/8/3K3n")
      end
    end

    context "when a black pawn reaches last row" do
      subject(:pawn_promotion) do
        described_class.new(old_board, new_board, location, destination)
      end
      let(:old_board) { "3k4/6P1/8/8/8/8/7p/3K4" }
      let(:new_board) { "3k4/6P1/8/8/8/8/8/3K3p" }
      let(:location) { "h2" }
      let(:destination) { "h1" }
      let(:player_colour) { "player_colour" }

      before do
        allow_any_instance_of(BoardMethods).to receive(
          :turn_indicator_from_fen_notation
        ).and_return("b")
        allow(pawn_promotion).to receive(:player_input).and_return(4)
      end

      it "returns a board where pawn equals rook" do
        result = pawn_promotion.promoted
        expect(result).to eq("3k4/6P1/8/8/8/8/8/3K3r")
      end
    end
  end
end
