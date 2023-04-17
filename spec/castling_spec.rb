require_relative "../lib/castling"

describe Castling do
  describe "castling" do
    before(:all) do
      @king_side_castle = "kingside castle"
      @queen_side_castle = "queenside castle"
    end

    context "when white player has kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }

      it "returns kingside castle" do
        result = kingside_castle.castling
        expect(result).to include(@king_side_castle)
      end
    end

    context "when white player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 w Qkq" }

      it "does not return kingside castle" do
        result = kingside_castle.castling
        expect(result).to_not include(@king_side_castle)
      end
    end

    context "when white player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KB1R w KQkq" }

      it "does not return kingside castle" do
        result = kingside_castle.castling
        expect(result).to_not include(@king_side_castle)
      end
    end

    context "when black player has kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }

      it "returns kingside castle" do
        result = kingside_castle.castling
        expect(result).to include(@king_side_castle)
      end
    end

    context "when black player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3kR1/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Qq" }

      it "does not return kingside castle" do
        result = kingside_castle.castling
        expect(result).to_not include(@king_side_castle)
      end
    end

    context "when black player has no kingside castling" do
      subject(:kingside_castle) { described_class.new(board) }
      let(:board) { "r3kb1r/pppppppp/8/8/8/8/PPPPPPPP/R3KB1R b KQkq" }

      it "does not return kingside castle" do
        result = kingside_castle.castling
        expect(result).to_not include(@king_side_castle)
      end
    end

    context "when white player has queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }

      it "returns queenside castle" do
        result = queenside_castle.castling
        expect(result).to include(@queen_side_castle)
      end
    end

    context "when white player has no queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 w kq" }

      it "does not return queenside castle" do
        result = queenside_castle.castling
        expect(result).to_not include(@queen_side_castle)
      end
    end

    context "when white player has no queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/1R2KB1R w KQkq" }

      it "does not return queenside castle" do
        result = queenside_castle.castling
        expect(result).to_not include(@queen_side_castle)
      end
    end

    context "when black player has queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }

      it "returns queenside castle" do
        result = queenside_castle.castling
        expect(result).to include(@queen_side_castle)
      end
    end

    context "when black player has no queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "r3kR1/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Q" }

      it "does not return queenside castle" do
        result = queenside_castle.castling
        expect(result).to_not include(@queen_side_castle)
      end
    end

    context "when black player has no queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "1r2kR1/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Qq" }

      it "does not return queenside castle" do
        result = queenside_castle.castling
        expect(result).to_not include(@queen_side_castle)
      end
    end

    context "when black player has no queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "3kR1/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Qq" }

      it "does not return queenside castle" do
        result = queenside_castle.castling
        expect(result).to_not include(@queen_side_castle)
      end
    end

    context "when black player has no queenside castling" do
      subject(:queenside_castle) { described_class.new(board) }
      let(:board) { "R2k1R2/pppppppp/8/8/8/8/PPPPPPPP/R3KR1 b Qq" }

      it "does not return queenside castle" do
        result = queenside_castle.castling
        expect(result).to_not include(@queen_side_castle)
      end
    end
  end
end
