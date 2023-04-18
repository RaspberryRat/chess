# frozen_string_literal: true

require_relative "board"
require_relative "game_pieces"
require_relative "move"
require_relative "available_moves"
require_relative "player"
require_relative "castling"
require_relative "check"
require_relative "board_method_module"
require "pry-byebug"

include BoardMethods

class Game
  attr_reader :move, :move_list, :castling
  attr_accessor :board,
                :player1,
                :player2,
                :current_player,
                :captured_pieces,
                :moved_piece

  def initialize(
    board = Board.new,
    move = Move,
    move_list = AvailableMoves,
    castling = Castling,
    current_player = nil
  )
    @board = board
    @move = move
    @move_list = move_list
    @current_player = current_player
    @player1 = nil
    @player2 = nil
    @captured_pieces = []
    @moved_piece = nil
    @castling = castling
  end

  def start
    create_players if @current_player.nil?

    clear_screen
    board.print_board
    @current_player = determine_player_turn

    loop do
      return winner if check_mate?

      puts "\n\nIt is #{current_player.name}'s turn\n"
      check_alert if king_in_check?
      puts "Select the piece you would like to move (e.g., 'a4')"

      loop do
        piece_selected = player_input
        player_colour = turn_indicator_from_fen_notation(board.board)
        allowed_moves = available_moves(piece_selected, player_colour)
        unless allowed_moves
          puts "No legal moves available, pick a different piece."
        end
        next unless allowed_moves

        allowed_destinations = legal_destinations(piece_selected, allowed_moves)
        if king_location(board.board) == piece_selected
          allowed_destinations << castle_moves
        end

        #TODO would like to somehow highlight available moves

        destination = verify_destination(allowed_destinations.flatten)
        @moved_piece = move_piece(piece_selected, destination)
        still_in_check_alert if king_in_check?(moved_piece)
        break unless king_in_check?(moved_piece)
        break unless @moved_piece || @move_piece.nil?
      end
      updated_board = castling_notation_update(@moved_piece)
      @board = Board.new(updated_board_state(updated_board), captured_pieces)
      @moved_piece = nil
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

      puts "Invalid destination, please choose from "
      print_available_destinations(allowed_destinations)
    end
  end

  # take piece location and moves to create destinations allowed
  def legal_destinations(piece, moves)
    return unless moves

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
    return true if input == "queenside castle"
    return true if input == "kingside castle"

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

  def available_moves(piece_selected, player_colour, board_state = board.board)
    moves = move_list.possible_move(piece_selected, player_colour, board_state)
  end

  def move_piece(location, destination, simulated = false, board = @board.board)
    moved_piece = move.move_loop(location, destination, board)
    return false unless moved_piece
    # doesn't add captured piece to list when doing check_mate checks
    return moved_piece[0] if simulated

    captured_piece = moved_piece[1]
    @captured_pieces << captured_piece unless captured_piece == false
    new_board = moved_piece[0]
  end

  def king_in_check?(boardstate = board.board)
    Check.checker(boardstate)
  end

  def check_alert
    puts "Your king is in check, you must move it out of check"
  end

  def check_mate?
    current_player_piece_locations = current_player_pieces
    current_player_colour = turn_indicator_from_fen_notation(board.board)
    current_player_piece_locations.each do |piece|
      moves = available_moves(piece, current_player_colour)
      destinations = legal_destinations(piece, moves)
      next if destinations.nil?
      destinations.each do |move|
        sim_move = simulate_move(piece, move)
        return false unless king_in_check?(sim_move)
      end
      true
    end
  end

  # refactor to combine with locations_not_current_player
  def current_player_pieces(board_state = @board.board)
    current_player_colour = turn_indicator_from_fen_notation(board_state)

    piece_locations = []

    expanded_board = expand_notation(board_state)
    expanded_board.each_with_index do |column, row|
      next if column.all?(".")

      column.each_with_index do |piece, column|
        next if piece == "."
        next if opposite_piece_color?(current_player_colour, piece)

        column_index = column_to_letter(column)
        row_index = row + 1
        piece_locations << column_index.to_s + row_index.to_s
      end
    end
    piece_locations
  end

  def simulate_move(piece, move)
    sim_move = move_piece(piece, move, true)
  end

  def winner
    winning_player = @current_player == @player1 ? @player2 : @player1
    print "\n\n#{winning_player.name} is the winner! Congratuations!\n\n"
    sleep(2)
    print "\n\nThank you for playing... Goodbye...\n"
    sleep(3)
    exit
  end

  def still_in_check_alert
    puts "Your King is still in check, this is not a legal move, you must make a different move"
  end

  def castle_moves
    castling.castling_moves(board.board)
  end

  def castling_notation_update(updated_board)
    castling.check_castle_notation(board.board, updated_board)
  end

  def clear_screen
    system("clear") || system("cls")
  end
end
