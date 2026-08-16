# frozen_string_literal: true

require "json"
require "tmpdir"
require_relative "../lib/save_game"

RSpec.describe SaveGame do
  describe ".load" do
    it "returns false when no saved game exists" do
      result = nil

      Dir.mktmpdir do |directory|
        save_path = File.join(directory, "chess_save.txt")
        stub_const("SaveGame::SAVE_PATH", save_path)

        expect do
          result = described_class.load
        end.to output("No saved game found.\n").to_stdout
      end

      expect(result).to be(false)
    end
  end

  describe ".save" do
    it "writes the game state as JSON" do
      Dir.mktmpdir do |directory|
        save_path = File.join(directory, "chess_save.txt")
        stub_const("SaveGame::SAVE_PATH", save_path)

        player1 = instance_double(Player, name: "White", computer: false)
        player2 = instance_double(Player, name: "Black", computer: false)
        board = "8/8/8/8/8/8/8/8 w -"

        described_class.save(board, player1, player2, 2, [])

        saved_data = JSON.parse(File.read(save_path))

        expect(saved_data).to include(
          "board_state" => board,
          "player1_name" => "White",
          "player2_name" => "Black",
          "player_count" => 2,
          "captured_pieces" => []
        )
      end
    end
  end
end
