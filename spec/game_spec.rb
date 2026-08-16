# frozen_string_literal: true

require_relative "../lib/game"

RSpec.describe Game do
  describe "the move log command" do
    it "displays the log when White has moved and Black has not" do
      game = described_class.new(2)

      game.player1 = Player.new(
        "White",
        1,
        false,
        [["e2", "e4"]]
      )

      game.player2 = Player.new(
        "Black",
        2,
        false,
        []
      )

      expect do
        game.send(:display_move_log)
      end.to output(/e2 to e4/).to_stdout
    end
  end
end
