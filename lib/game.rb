# frozen_string_literal: true

require_relative 'board'
require_relative 'game_pieces'
require_relative 'move'
require_relative 'available_moves'
require 'pry-byebug'


class Game

  attr_reader :move, :move_list
  attr_accessor :board
  
  def initialize(board = Board.new, move = Move, move_list = AvailableMoves)
    @board = board
    @move = move
    @move_list = move_list
  end

  def start
    clear_screen
    board.print_board
    # TODO pawn is not taking piece legally, it took piece directly in front, also allows double move at al time
    loop do
      puts "Select the piece you would like to move (e.g., 'a4')"
      piece_selected = player_input
      allowed_moves = available_moves(piece_selected)
      next unless allowed_moves
      allowed_destinations = legal_destinations(piece_selected, allowed_moves)
      # from available_moves? need to create all possible desintation locations

      #TODO would like to somehow highlight available moves
      
      destination = verify_destination(allowed_destinations)
      # Add a check to make sure destination is included in allowed_destinations
      moved_piece = move_piece(piece_selected, destination)
      binding.pry
      break unless moved_piece

      # Need to create a better factory for this
      @board = Board.new(moved_piece)
      board.print_board
    end
    # need to do game check and restart move loop
    # TODO add players
  end

  def verify_destination(allowed_destinations)
    print 'Available destinations: '
    print_available_destinations(allowed_destinations)
    loop do
      destination = player_input
      return destination if allowed_destinations.include?(destination)
      # TODO working here
      puts 'Invalid destination, please choose from '
      print_available_destinations
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

  # TODO figure this out to use and and commans correctly
  def print_available_destinations(destinations)
    destinations.each { |destination| print "#{destination}, "}
    print "\n"
  end

  private

  def available_moves(piece_selected)
    moves = move_list.possible_move(piece_selected, board.board)
    return moves unless moves == false

    puts 'No legal moves available, pick a different piece.'
    false
  end

  def move_piece(location, destination)
    moved_piece = move.move_loop(location, destination, board.board)
    return false unless moved_piece

    captured_piece = moved_piece[1]
    new_board = moved_piece[0]
  end

  def convert_column(column)
    {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6,
      h: 7
    }.fetch(column.to_sym)
  end

  def column_to_letter(num)
    {
      0 => 'a',
      1 => 'b',
      2 => 'c',
      3 => 'd',
      4 => 'e',
      5 => 'f',
      6 => 'g',
      7 => 'h'
    }.fetch(num)
  end

  def clear_screen
    system("clear") || system("cls")
  end
end
