require_relative "../lib/enpassant"

describe EnPassant do
  describe "#enpassant_notation" do
    context "when white pawn moves 2 squares" do
      subject(:pawn_double) do
        described_class.new(board, location, destination)
      end
      let(:board) { "8/8/8/8/P7/8/8/8 w -" }
      let(:location) { "a2" }
      let(:destination) { "a4" }

      it "returns board with enpassant target" do
        result = pawn_double.enpassant_notation
        expect(result).to eq("8/8/8/8/P7/8/8/8 w a3")
      end
    end

    context "when black pawn moves 2 squares" do
      subject(:pawn_double) do
        described_class.new(board, location, destination)
      end
      let(:board) { "8/8/8/7p/P7/8/8/8 b -" }
      let(:location) { "h7" }
      let(:destination) { "h5" }

      it "returns board with enpassant target" do
        result = pawn_double.enpassant_notation
        expect(result).to eq("8/8/8/7p/P7/8/8/8 b h6")
      end
    end

    context "when white pawn moves 1 square" do
      subject(:pawn_double) do
        described_class.new(board, location, destination)
      end
      let(:board) { "8/8/8/8/8/P7/8/8 w -" }
      let(:location) { "a2" }
      let(:destination) { "a3" }

      it "returns board without enpassant target" do
        result = pawn_double.enpassant_notation
        expect(result).to eq("8/8/8/8/8/P7/8/8 w -")
      end
    end

    context "when black pawn moves 1 square" do
      subject(:pawn_double) do
        described_class.new(board, location, destination)
      end
      let(:board) { "8/8/7p/8/P7/8/8/8 b -" }
      let(:location) { "h7" }
      let(:destination) { "h6" }

      it "returns board without enpassant target" do
        result = pawn_double.enpassant_notation
        expect(result).to eq("8/8/7p/8/P7/8/8/8 b -")
      end
    end
  end

  describe "#enpassant_available?" do
    context "when enpassant available" do
      subject(:enpassant) { described_class.new(board, location) }
      let(:board) { "8/8/8/pP6/8/8/8/8 w a6" }
      let(:location) { "b5" }

      it "returns true" do
        result = enpassant.enpassant_available?
        expect(result).to be(true)
      end
    end

    context "when enpassant not available" do
      subject(:enpassant) { described_class.new(board, location) }
      let(:board) { "8/8/8/pP6/8/8/8/8 w -" }
      let(:location) { "b5" }

      it "returns true" do
        result = enpassant.enpassant_available?
        expect(result).to be(false)
      end
    end
  end

  describe "#enpassant_move" do
    context "when enpassant available" do
      subject(:enpassant) { described_class.new(board, location) }
      let(:board) { "8/8/8/pP6/8/8/8/8 w a6" }
      let(:location) { "b5" }

      it "adds enpassant move" do
        result = enpassant.enpassant_move
        expect(result).to eq([1, -1])
      end
    end

    context "when enpassant available" do
      subject(:enpassant) { described_class.new(board, location) }
      let(:board) { "8/8/8/8/6pP/8/8/8 b h3" }
      let(:location) { "g4" }

      it "adds enpassant move" do
        result = enpassant.enpassant_move
        expect(result).to eq([-1, 1])
      end
    end
  end
end
