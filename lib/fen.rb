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
    fen_array = player_fen.split(" ")
    fen_array[0] = fen_array[0].split("/")

    i = 0
    fen_array.flatten.each do |line|
      i += 1
      if i <= 8
        return false unless squares_in_row?(line)
        return false unless line.match(/^[rnbqkpRNBQKP1-8]{1,8}$/)
      elsif i == 9
        return false unless line == "w" || line == "b"
      elsif i == 10
        next if line.match(/^[KQkq]+$/) || line.match(/^([a-h][1-8]|-)$/)
        false
      elsif i == 11
        return false unless line.match(/^([a-h][1-8]|-)$/)
      end
    end
    true
  end
end
