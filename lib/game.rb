# frozen_string_literal: true

require_relative "board"
require_relative "game_pieces"
require_relative "move"
require_relative "available_moves"
require_relative "player"
require_relative "castling"
require_relative "check"
require_relative "./modules/board_method_module"
require_relative "checkmate"
require_relative "promotion"
require_relative "enpassant"
require_relative "save_game"
require_relative "highlight"

include BoardMethods

class Game
  def self.load_game(
    player_count,
    board_state,
    player1,
    player2,
    captured_pieces
  )
    new(player_count, board_state, player1, player2, captured_pieces).load_save
  end

  attr_reader :move, :move_list, :castling, :player_count
  attr_accessor :board,
                :player1,
                :player2,
                :current_player,
                :captured_pieces,
                :moved_piece

  def initialize(
    player_count,
    board = Board.new,
    player1 = nil,
    player2 = nil,
    captured_pieces = [],
    move = Move,
    move_list = AvailableMoves,
    castling = Castling,
    current_player = nil
  )
    @player_count = player_count
    @board = board
    @move = move
    @move_list = move_list
    @current_player = current_player
    @player1 = player1
    @player2 = player2
    @captured_pieces = captured_pieces
    @moved_piece = nil
    @castling = castling
  end

  def load_save
    player_colour = turn_indicator_from_fen_notation(board.board)
    @current_player = player_colour == "w" ? player1 : player2
    start
  end

  def start
    create_players if @current_player.nil?

    clear_screen
    board.board = enpassant_blank_notation(board.board)
    print_reminder
    board.print_board

    @current_player = determine_player_turn

    loop do
      return winner if check_mate?
      # print_note

      print_turn
      check_alert if king_in_check?
      print_piece_offer

      loop do
        piece_selected = choose_piece
        player_colour = turn_indicator_from_fen_notation(board.board)
        allowed_moves =
          available_moves(piece_selected, player_colour, board.board)
        allowed_moves = en_passant_move(allowed_moves, piece_selected)
        incorrect_player_choice unless allowed_moves
        next unless allowed_moves

        allowed_destinations = legal_destinations(piece_selected, allowed_moves)
        if king_location(board.board) == piece_selected
          allowed_destinations << castle_moves
        end

        destination =
          verify_destination(piece_selected, allowed_destinations.flatten)

        @moved_piece = move_piece(piece_selected, destination)
        if king_in_check?(moved_piece)
          @captured_pieces.pop
          still_in_check_alert
        else
          if en_passant_target?(piece_selected, destination)
            @moved_piece =
              en_passant_update(moved_piece, piece_selected, destination)
          end
          computer_choice_print(piece_selected, "yes")
          computer_choice_print(destination)

          @moved_piece = promote(moved_piece, piece_selected, destination)
          @moved_piece =
            enpassant_add_notation(moved_piece, piece_selected, destination)
          break unless @moved_piece.nil? || @moved_piece == false
        end
      end
      updated_board = castling_notation_update(@moved_piece)
      @board = Board.new(updated_board_state(updated_board), captured_pieces)
      @moved_piece = nil
      clear_screen
      print_reminder
      board.print_board
      @current_player = determine_player_turn
    end
  end

  private

  def print_reminder
    return if player1.computer && player2.computer

    print "\n\nEnter 'save' to save your game, or 'exit' or 'quit' to exit"
  end

  def print_note
    print "\n\n#{board.board}"
  end

  def verify_destination(piece, allowed_destinations)
    destination_printout_for_human_player(piece, allowed_destinations)
    loop do
      destination = choose_piece(allowed_destinations)
      return destination if allowed_destinations.include?(destination)

      incorrect_player_destination(allowed_destinations)
    end
  end

  def player_input
    loop do
      choice = gets.chomp.downcase
      choice = "kingside castle" if choice == "k"
      choice = "queenside castle" if choice == "q"
      return choice if verify_input(choice)

      puts "Invalid input. Your input must be in format 'a4' from letters a to h and numbers 1-8. Please enter a valid choice."
    end
  end

  def verify_input(input)
    return save_game if input == "save"
    return exit if input == "exit" || input == "q" || input == "quit"
    return true if /^[a-h][1-8]$/.match(input)
    return true if input == "queenside castle"
    return true if input == "kingside castle"

    false
  end

  def save_game
    SaveGame.save(board.board, player1, player2, player_count, captured_pieces)
    puts "Game saving"
    3.times do
      sleep(0.3)
      puts "."
    end
    print " Game saved!"
    print "\nGoodbye\n"
    exit
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
    player1_colour = choose_colour if player_count == 1

    if player1_colour.nil? && player_count == 2
      @player1 = Player.new(ask_name, 1, false)
      @player2 = Player.new(ask_name, 2, false)
    elsif player_count == 3
      @player1 = Player.new("The Computer 1", 1, true)
      @player2 = Player.new("The Computer 2", 2, true)
    else
      if player1_colour == "white"
        @player1 = Player.new(ask_name, 1, false)
        @player2 = Player.new("The Computer", 2, true)
      else
        @player1 = Player.new("The Computer", 1, true)
        @player2 = Player.new(ask_name, 2, false)
      end
    end
    @current_player = player1
  end

  def choose_colour
    print "\n\nWhat colour do you want to be?\n\n\n"
    sleep(0.6)
    print "1: white\n2: black\n\n\n>> "
    choice = colour_choice_input
    return "white" if choice == 1

    "black"
  end

  def colour_choice_input
    loop do
      choice = gets.chomp.to_i
      return choice if (1..2).include?(choice)

      puts "You must enter 1 or 2..."
      print ">> "
    end
  end

  def ask_name
    puts "You are #{@player1.nil? ? "Player 1" : "Player 2"}. What is your name?"
    print ">> "
    gets.chomp.strip
  end

  def move_piece(location, destination, board = @board.board)
    moved_piece = move.move_loop(location, destination, board)
    return false unless moved_piece

    captured_piece = moved_piece[1]
    @captured_pieces << captured_piece unless captured_piece == false
    new_board = moved_piece[0]
  end

  def king_in_check?(boardstate = board.board)
    Check.checker(boardstate)
  end

  def check_alert
    return if current_player.computer == true
    puts "\e[31mYour king is in check, you must move it out of check!\e[0m"
  end

  def check_mate?
    Checkmate.checkmate(board.board)
  end

  def winner
    winning_player = @current_player == @player1 ? @player2 : @player1
    print "\n\n\e[32m#{winning_player.name} is the winner! Congratuations!\e[0m\n\n"

    sleep(2)
    print "\n\nThank you for playing... Goodbye...\n"
    sleep(3)
    exit
  end

  def still_in_check_alert
    return unless current_player.computer == false
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

  def promote(new_board, location, destination)
    Promotion.promote(
      board.board,
      new_board,
      location,
      destination,
      current_player
    )
  end

  def enpassant_add_notation(board_state, piece_location, destination)
    EnPassant.enpassant(board_state, piece_location, destination)
  end

  def enpassant_blank_notation(board_state)
    EnPassant.blank_notation(board_state)
  end

  def en_passant_move(moves, piece_selected)
    return moves unless EnPassant.legal_move?(board.board, piece_selected)

    moves = [] if moves == false
    moves << EnPassant.moves(board.board, piece_selected)
  end

  def en_passant_target?(piece_selected, destination)
    EnPassant.last_move_enpassant?(@moved_piece, piece_selected, destination)
  end

  def en_passant_update(board_state, piece_selected, destination)
    board_and_piece =
      EnPassant.update_board(board_state, piece_selected, destination)
    @captured_pieces << board_and_piece[1]
    board_and_piece[0]
  end

  def choose_piece(choice = nil)
    return player_input if current_player.computer == false

    computer_choice(choice)
  end

  def computer_choice(choices = nil)
    return choices.sample unless choices.nil?

    current_player_pieces(board.board).sample
  end

  def computer_choice_print(selection, piece = nil)
    return unless current_player.computer == true
    sleep(0.5)
    print "\n#{selection}\n"
    sleep(0.3)
    print "to" unless piece.nil?
    sleep(0.5)
  end

  def incorrect_player_choice
    return unless current_player.computer == false

    puts "\e[33mNo legal moves available, pick a different piece.\e[0m"
  end

  def incorrect_player_destination(allowed_destinations)
    return unless current_player.computer == false

    puts "Invalid destination, please choose from "
    print_available_destinations(allowed_destinations)
  end

  def destination_printout_for_human_player(piece, allowed_destinations)
    return if current_player.computer == true

    print_hightlighted_board(piece, allowed_destinations)

    print "Available destinations: "
    print_available_destinations(allowed_destinations)
    print "\n>> "
  end

  def print_hightlighted_board(piece, destinations)
    clear_screen
    print_reminder
    Highlight.print(board, piece, destinations)
    print_turn
    print_piece_offer
    print piece.to_s
    print "\n"
  end

  def print_piece_offer
    puts "Select the piece you would like to move (e.g., 'a4')"
    print ">> "
  end

  def print_turn
    puts "\n\nIt is #{current_player.name}'s turn\n"
  end
end
