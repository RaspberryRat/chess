require_relative "../lib/castling"

describe Castling do
  describe "castling_available?" do
    context "when white player has kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }

      it "returns true" do
        result = kingside_castle.castling_available?
        expect(result).to be(true)
      end
    end

    context "when white player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 w Qkq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when white player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KB1R w KQkq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when black player has kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }

      it "returns true" do
        result = kingside_castle.castling_available?
        expect(result).to be(true)
      end
    end

    context "when black player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3kR1/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Qq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when black player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3kb1r/pppppppp/8/8/8/8/PPPPPPPP/R3KB1R b KQkq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when white player has queenside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }

      it "returns true" do
        result = kingside_castle.castling_available?
        expect(result).to be(true)
      end
    end

    context "when white player has no queenside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 w Qkq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when white player has no queenside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KB1R w KQkq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when black player has queenside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }

      it "returns true" do
        result = kingside_castle.castling_available?
        expect(result).to be(true)
      end
    end

    context "when black player has no queenside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3kR1/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Qq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end

    context "when black player has no queenside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3kb1r/pppppppp/8/8/8/8/PPPPPPPP/R3KB1R b KQkq" }

      it "returns false" do
        result = kingside_castle.castling_available?
        expect(result).to be(false)
      end
    end
  end
end
