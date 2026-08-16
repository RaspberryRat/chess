# frozen_string_literal: true
class Fen
  def self.confirm
    new.load_by_fen
  end

  def load_by_fen
    puts "Refer to the readme file for examples of fen notation..."
    puts "New game: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq'"
    print "Enter fen notation:\n>> "
    player_notation
  end

  private

  def player_notation
    loop do
      player_fen = gets.chomp.rstrip.lstrip
      return player_fen if confirm_notation?(player_fen)

      puts "That notation is incorrect, refer to the readme..."
      print "Enter fen notation:\n>> "
    end
  end

  # confirms the right number of squares are in each row of fen notation
  def squares_in_row?(row)
    row = row.split("")
    row_count = 0

    row.each do |char|
      row_count += 1 if char.to_i.zero?
      row_count += char.to_i
    end
    return false unless row_count == 8

    true
  end

  def confirm_notation?(player_fen)
    fields = player_fen.split
    return false unless (2..4).cover?(fields.length)

    board, active_colour, castling, en_passant = fields
    rows = board.split("/")

    return false unless rows.length == 8

    valid_rows =
      rows.all? do |row|
        squares_in_row?(row) &&
          row.match?(/\A[rnbqkpRNBQKP1-8]{1,8}\z/)
      end

    return false unless valid_rows
    return false unless %w[w b].include?(active_colour)

    unless castling.nil?
      valid_castling =
        castling == "-" || castling.match?(/\AK?Q?k?q?\z/)

      return false unless valid_castling
    end

    unless en_passant.nil?
      valid_en_passant =
        en_passant == "-" || en_passant.match?(/\A[a-h][36]\z/)

      return false unless valid_en_passant
    end

    true
  end
end
