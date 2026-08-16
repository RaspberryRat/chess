# frozen_string_literal: true

require_relative "../lib/move"

RSpec.describe Move do
  describe ".move_loop" do
    let(:starting_board) do
      "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq"
    end

    it "moves a piece to a legal destination" do
      result = described_class.move_loop("b1", "c3", starting_board)

      expect(result).to eq(
        [
          "rnbqkbnr/pppppppp/8/8/8/2N5/PPPPPPPP/R1BQKBNR w KQkq",
          false
        ]
      )
    end

    it "rejects an empty starting square" do
      result = nil

      expect do
        result = described_class.move_loop("b3", "b4", starting_board)
      end.to output("There is no piece at location 'b3'.\n").to_stdout

      expect(result).to be(false)
    end

    it "rejects an illegal move for the selected piece" do
      result = nil

      expect do
        result = described_class.move_loop("b2", "b5", starting_board)
      end.to output(
        "That is not a legal move, please choose a different destination.\n"
      ).to_stdout

      expect(result).to be(false)
    end

    it "returns the captured piece when making a capture" do
      board = "8/8/8/8/8/1p6/P7/8 w -"

      result = described_class.move_loop("a2", "b3", board)

      expect(result).to eq(
        [
          "8/8/8/8/8/1P6/8/8 w -",
          "p"
        ]
      )
    end
  end
end
