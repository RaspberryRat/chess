# frozen_string_literal: true

require "json"
require_relative "game"

class SaveGame
  def self.save(board_state, player1, player2, player_count, captured_pieces)
    new(board_state, player1, player2, player_count, captured_pieces).to_json
  end

  def self.load
    new.from_json
  end

  attr_accessor :board_state,
                :player1,
                :player2,
                :player_count,
                :captured_pieces

  def initialize(
    board_state = nil,
    player1 = nil,
    player2 = nil,
    player_count = nil,
    captured_pieces = nil
  )
    @board_state = board_state
    @player1 = player1
    @player2 = player2
    @player_count = player_count
    @captured_pieces = captured_pieces
  end

  def to_json
    game_save =
      JSON.dump (
                  {
                    board_state: @board_state,
                    player1_name: @player1.name,
                    player1_ai: @player1.computer,
                    player2_name: @player2.name,
                    player2_ai: @player2.computer,
                    player_count: @player_count,
                    captured_pieces: @captured_pieces
                  }
                )
    save = File.open("./saves/chess_save.txt", "w")
    save.puts game_save
    save.close
  end

  def from_json
    3.times do
      print "."
      sleep(0.3)
    end
    puts "Game loaded!\n\n"

    save_file = File.read("./saves/chess_save.txt")
    save_data = JSON.parse(save_file)
    @board_state = save_data["board_state"]
    create_players(save_data)
    @player_count = save_data["player_count"]
    @captured_pieces = save_data["captured_pieces"]

    Game.load_game(
      player_count,
      Board.new(board_state, captured_pieces),
      player1,
      player2,
      captured_pieces
    )
  end

  def create_players(save_data)
    @player1 = Player.new(save_data["player1_name"], save_data["player1_ai"])
    @player2 = Player.new(save_data["player2_name"], save_data["player2_ai"])
  end
end
