# frozen_string_literal: true

require_relative "board"
require_relative "game_pieces"
require_relative "move"
require_relative "available_moves"
require_relative "player"
require "pry-byebug"

class Game
  attr_reader :move, :move_list
  attr_accessor :board, :player1, :player2, :current_player, :captured_pieces

  def initialize(
    board = Board.new,
    move = Move,
    move_list = AvailableMoves,
    current_player = nil
  )
    @board = board
    @move = move
    @move_list = move_list
    @current_player = current_player
    @player1 = nil
    @player2 = nil
    @captured_pieces = []
  end

  def start
    create_players if @current_player.nil?

    clear_screen
    board.print_board
    @current_player = determine_player_turn

    loop do
      puts "\n\nIt is #{current_player.name}'s turn\n"
      puts "Select the piece you would like to move (e.g., 'a4')"
      piece_selected = player_input
      allowed_moves = available_moves(piece_selected)
      next unless allowed_moves
      allowed_destinations = legal_destinations(piece_selected, allowed_moves)

      #TODO would like to somehow highlight available moves

      destination = verify_destination(allowed_destinations)
      moved_piece = move_piece(piece_selected, destination)
      break unless moved_piece
      @board = Board.new(updated_board_state(moved_piece), captured_pieces)
      clear_screen
      board.print_board
      @current_player = determine_player_turn
    end
  end

  def verify_destination(allowed_destinations)
    print "Available destinations: "
    print_available_destinations(allowed_destinations)
    loop do
      destination = player_input
      return destination if allowed_destinations.include?(destination)
      # TODO working here
      puts "Invalid destination, please choose from "
      print_available_destinations(allowed_destinations)
    end
  end

  # take piece location and moves to create destinations allowed
  def legal_destinations(piece, moves)
    destinations_available = []
    piece_column = convert_column(piece[0])
    piece_row = piece[1].to_i
    # piece notation is [row, column]
    piece_notation = [piece_row, piece_column]
    i = 0
    moves.length.times do
      destination_row = piece_notation[0] + moves[i][0]
      destination_column = column_to_letter(piece_notation[1] + moves[i][1])
      destinations_available << destination_column.to_s + destination_row.to_s
      i += 1
    end
    destinations_available
  end

  def player_input
    loop do
      choice = gets.chomp
      return choice if verify_input(choice)

      puts "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
    end
  end

  def verify_input(input)
    return true if /^[a-h][1-8]$/.match(input)

    false
  end

  def print_available_destinations(destinations)
    destinations = destinations.sort
    count = destinations.length - 1

    if destinations.length == 1
      print "#{destinations[0]}\n"
      return
    end

    destinations.each_with_index do |destination, i|
      print "#{destination}, " if i <= count - 2
      print "#{destination} " if i == count - 1
      print "and #{destination}" if i == count
    end
    print "\n"
  end

  def determine_player_turn
    turn_colour = turn_indicator_from_fen_notation(board.board)

    return @current_player = @player1 if turn_colour == "w"

    return @current_player = @player2 if turn_colour == "b"
  end

  private

  # takes the board state from fen notation, finds the w or b after first space
  def turn_indicator_from_fen_notation(board_state)
    notation = board_state

    notation[notation.index(" ") + 1]
  end

  def updated_board_state(board_state)
    current_player_turn = turn_indicator_from_fen_notation(board_state)

    ind_location_turn = board_state.index(" ") + 1

    if current_player_turn == "w"
      board_state[ind_location_turn] = "b"
      return board_state
    elsif current_player_turn == "b"
      board_state[ind_location_turn] = "w"
    end
    board_state
  end

  def create_players
    @player1 = Player.new(self, ask_name, 1)
    @player2 = Player.new(self, ask_name, 2)
    @current_player = player1
  end

  def ask_name
    puts "You are #{@player1.nil? ? "Player 1" : "Player 2"}. What is your name?"
    gets.chomp.strip
  end

  def available_moves(piece_selected)
    moves = move_list.possible_move(piece_selected, board.board, current_player)
    return moves unless moves == false

    puts "No legal moves available, pick a different piece."
    false
  end

  def move_piece(location, destination)
    moved_piece = move.move_loop(location, destination, board.board)
    return false unless moved_piece

    captured_piece = moved_piece[1]
    @captured_pieces << captured_piece unless captured_piece == false
    new_board = moved_piece[0]
  end

  def convert_column(column)
    { a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7 }.fetch(column.to_sym)
  end

  def column_to_letter(num)
    {
      0 => "a",
      1 => "b",
      2 => "c",
      3 => "d",
      4 => "e",
      5 => "f",
      6 => "g",
      7 => "h"
    }.fetch(num)
  end

  def clear_screen
    system("clear") || system("cls")
  end
end
