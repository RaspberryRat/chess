# frozen_string_literal: true

require_relative "./modules/board_method_module"

include BoardMethods

class Promotion
  def self.promote(old_board, new_board, location, destination, current_player)
    new(old_board, new_board, location, destination, current_player).promoted
  end

  attr_reader :player_colour,
              :location,
              :destination,
              :new_board,
              :old_board,
              :board_state,
              :current_player

  def initialize(old_board, new_board, location, destination, current_player)
    @old_board = old_board
    @new_board = new_board
    @location = location
    @destination = destination
    @current_player = current_player
    @player_colour = turn_indicator_from_fen_notation(old_board)
  end

  def promoted
    new_board_expanded = expand_notation(new_board)
    old_board_expanded = expand_notation(old_board)

    pawn_change = confirm_pawn?(old_board_expanded, new_board_expanded)
    return new_board unless pawn_change

    promote_piece(new_board_expanded)
  end

  private

  def confirm_pawn?(old_board_expanded, new_board_expanded)
    if player_colour == "w"
      change = new_board_expanded[7] - old_board_expanded[7]
      return if change == false

      piece = change.shift
      return false unless piece == "P"
    elsif player_colour == "b"
      change = new_board_expanded[0] - old_board_expanded[0]
      return if change == false

      piece = change.shift
      return false unless piece == "p"
    end
    piece
  end

  def promote_piece(new_board_expanded)
    other_notation = save_notation_after_piece_placement(new_board)
    new_location = convert_to_grid(destination)
    new_board_expanded[new_location[0]][new_location[1]] = promoted_piece
    board = array_to_fen_notation(new_board_expanded)
    add_post_piece_notation(board, other_notation).rstrip
  end

  def promoted_piece
    choice = player_input
    retrieve_piece(choice)
  end

  def retrieve_piece(player_choice)
    piece = { 1 => "q", 2 => "b", 3 => "n", 4 => "r" }.fetch(player_choice)
    return piece.upcase if player_colour == "w"

    piece
  end

  def player_input
    return 1 if current_player.computer == true
    loop do
      display_promote_options
      choice = gets.chomp.to_i
      return choice if (1..4).include?(choice)
    end
  end

  def display_promote_options
    print "\n\n\nChoose what piece you want to promote your pawn too"
    print "\n1: Queen\n2: Bishop\n3: Knight\n4: Rook\n"
    print ">> "
  end
end
