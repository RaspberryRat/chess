require_relative "../lib/castling"

describe Castling do
  describe "castling_available?" do
    context "when white player has kingside castling" do
      subject(:kingside_castle) { described_class.new(board, current_player) }
      let(:board) { double("board") }
      let(:current_player) { double("current_player") }

      it "returns true" do
        result = kingside_castle.castling_available?
        expect(result).to be(true)
      end
    end
  end
end
