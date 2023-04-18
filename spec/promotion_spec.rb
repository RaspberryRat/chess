require_relative "../lib/promotion"

describe Promotion do
  describe "#promoted" do
    context "when a pawn reaches last row" do
      subject(:pawn_promotion) { described_class.new(old_board, new_board) }
      let(:old_board) { "8/P7/8/8/8/8/8/8" }
      let(:new_board) { "P7/8/8/8/8/8/8/8" }

      it "returns a board where pawn equals queen" do
        result = pawn_promotion.promoted
        expect(result).to eq("Q7/8/8/8/8/8/8/8")
      end
    end
  end
end
