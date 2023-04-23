require_relative "../lib/board_squares/board_square"

describe BoardSquare do
  describe ".for" do
    context "when notation is line break" do
      subject(:new_square) { described_class }
      let(:new_line) { "/" }
      let(:color) { "color" }

      it "is BoardSquare" do
        returned_object = new_square.for(new_line, color)
        expect(returned_object).to be_an_instance_of(BoardSquare)
      end

      it "returns a new line" do
        next_line = "\u001b[0m\n"
        output = new_square.for(new_line, color).to_s
        expect(output).to eq(next_line)
      end
    end
  end
end
