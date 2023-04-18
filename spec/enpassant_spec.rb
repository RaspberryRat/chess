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
end
