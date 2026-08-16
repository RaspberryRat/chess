# frozen_string_literal: true

require_relative "../lib/fen"

RSpec.describe Fen do
  subject(:fen_loader) { described_class.new }

  let(:piece_placement) do
    "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR"
  end

  let(:valid_fen) do
    "#{piece_placement} w KQkq -"
  end

  before do
    allow(fen_loader).to receive(:puts)
    allow(fen_loader).to receive(:print)
  end

  describe "#load_by_fen" do
    it "accepts valid FEN notation" do
      allow(fen_loader).to receive(:gets).and_return("#{valid_fen}\n")

      expect(fen_loader.load_by_fen).to eq(valid_fen)
    end

    it "rejects notation without an active colour" do
      allow(fen_loader).to receive(:gets).and_return(
        "#{piece_placement}\n",
        "#{valid_fen}\n"
      )

      expect(fen_loader.load_by_fen).to eq(valid_fen)
    end

    it "rejects an invalid castling field" do
      invalid_fen = "#{piece_placement} w XYZ -"

      allow(fen_loader).to receive(:gets).and_return(
        "#{invalid_fen}\n",
        "#{valid_fen}\n"
      )

      expect(fen_loader.load_by_fen).to eq(valid_fen)
    end
  end
end
