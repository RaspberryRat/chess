require_relative "../lib/castling"

describe Castling do
  describe "#castling" do
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
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KR2 w Qkq" }

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
      let(:board) { "r3kr2/pppppppp/8/8/8/8/PPPPPPPP/R3KR2 b Qq" }

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

  describe "#update_castling_notation" do
    context "when king is moved, castling notation removed for white player" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }
      let(:new_board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R2K3R w KQkq" }

      it "returns notation with K castling notation removed" do
        result = king_move.update_castling_notation
        expect(result).to eq("r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R2K3R w kq")
      end
    end

    context "when king is moved, castling notation removed for black player" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }
      let(:new_board) { "r2k3r/pppppppp/8/8/8/8/PPPPPPPP/R2K3R b KQkq" }

      it "returns notation with K castling notation removed" do
        result = king_move.update_castling_notation
        expect(result).to eq("r2k3r/pppppppp/8/8/8/8/PPPPPPPP/R2K3R b KQ")
      end
    end

    context "when king isn't moved, castling notation unchanged" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }
      let(:new_board) { "r3k2r/pppppppp/8/8/8/7P/PPPPPPP1/R3K2R w KQkq" }

      it "returns notation with castling notation" do
        result = king_move.update_castling_notation
        expect(result).to eq("r3k2r/pppppppp/8/8/8/7P/PPPPPPP1/R3K2R w KQkq")
      end
    end

    context "when kingside rook is moved, kingside castling notation removed for white player" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }
      let(:new_board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K1R1 w KQkq" }

      it "returns notation with K kingside castling notation removed" do
        result = king_move.update_castling_notation
        expect(result).to eq("r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K1R1 w Qkq")
      end
    end

    context "when queenside rook is moved, queenside castling notation removed for white player" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w KQkq" }
      let(:new_board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/1R2K2R w KQkq" }

      it "returns notation with K kingside castling notation removed" do
        result = king_move.update_castling_notation
        expect(result).to eq("r3k2r/pppppppp/8/8/8/8/PPPPPPPP/1R2K2R w Kkq")
      end
    end

    context "when kingside rook is moved, kingside castling notation removed for black player" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }
      let(:new_board) { "r3k1r1/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }

      it "returns notation with K kingside castling notation removed" do
        result = king_move.update_castling_notation
        expect(result).to eq("r3k1r1/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQq")
      end
    end

    context "when queenside rook is moved, queenside castling notation removed for black player" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "r3k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }
      let(:new_board) { "1r2k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQkq" }

      it "returns notation with K kingside castling notation removed" do
        result = king_move.update_castling_notation
        expect(result).to eq("1r2k2r/pppppppp/8/8/8/8/PPPPPPPP/R3K2R b KQk")
      end
    end

    context "when last notification removed" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "k7/pppppppp/8/8/8/8/PPPPPPPP/R3K2R w K" }
      let(:new_board) { "k7/pppppppp/8/8/8/8/PPPPPPPP/4K1R1 w K" }

      it "returns notation without a space at end" do
        result = king_move.update_castling_notation
        expect(result).to eq("k7/pppppppp/8/8/8/8/PPPPPPPP/4K1R1 w")
      end
    end

    context "when white queenside rook moved" do
      subject(:king_move) { described_class.new(board, new_board) }
      let(:board) { "2r1k2r/pppppppp/8/8/8/8/PPPPPPPP/R3KR2 w Qk" }
      let(:new_board) { "2r1k2r/pppppppp/8/8/8/8/PPPPPPPP/1R2KR2 w Qk" }

      it "returns white queenside notation" do
        result = king_move.update_castling_notation
        expect(result).to eq("2r1k2r/pppppppp/8/8/8/8/PPPPPPPP/1R2KR2 w k")
      end
    end

    context "when check on way to castle square" do
      subject(:king_move) { described_class.new(board) }
      let(:board) { "8/8/8/1rrr1qr1/8/8/8/R3K2R w KQ" }

      it "returns false" do
        result = king_move.castling
        expect(result).to eq([])
      end
    end
  end
end
