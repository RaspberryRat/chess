white_king = "\u2654"
white_queen = "\u2655"
white_rook = "\u2656"
white_bishop = "\u2657"
white_knight = "\u2658"
white_pawn = "\u2659"

black_king = "\u265A"
black_queen = "\u265B"
black_rook = "\u265C"
black_bishop = "\u265D"
black_knight = "\u265E"
black_pawn = "\u265F"

underline = "\u001b[4m"
green_square = "\u001b[48;5;107m"
white_square = "\u001b[48;5;231m"
empty_row_green = "#{green_square}   #{white_square}   " * 4 + "\u001b[0m\n"
empty_row_white = "#{white_square}   #{green_square}   " * 4 + "\u001b[0m\n"
# row 8 ROW
puts "\n" * 5
print "8 "
print "#{green_square} #{black_rook} "
print "#{white_square} #{black_knight} "
print "#{green_square} #{black_bishop} "
print "#{white_square} #{black_king} "
print "#{green_square} #{black_queen} "
print "#{white_square} #{black_bishop} "
print "#{green_square} #{black_knight} "
print "#{white_square} #{black_rook} "
#end of line
puts "\u001b[0m\n"
#line 7
print "7 "
print "#{white_square} #{black_pawn} #{green_square} #{black_pawn} " * 4
#end of line
puts "\u001b[0m\n"
#line 6
print "6 #{empty_row_green}"
#line 5
print "5 #{empty_row_white}"
# line 4
print "4 #{empty_row_green}"
# line 3
print "3 #{empty_row_white}"
# line 2 
print "2 "
print "#{green_square} #{white_pawn} #{white_square} #{white_pawn} " * 4
#end of line
puts "\u001b[0m\n"
# line 1
print "1 "
print "#{white_square} #{white_rook} "
print "#{green_square} #{white_knight} "
print "#{white_square} #{white_bishop} "
print "#{green_square} #{white_king} "
print "#{white_square} #{white_queen} "
print "#{green_square} #{white_bishop} "
print "#{white_square} #{white_knight} "
print "#{green_square} #{white_rook} "
#end of line
puts "\u001b[0m\n"
print "   A  B  C  D  E  F  G  H"
puts "\n" * 5

#empty board

i = 8
chess_board = ''
8.times do
  chess_board += "#{i.to_s} "
  chess_board += i.even? ? empty_row_green : empty_row_white
  i -= 1
end
chess_board += "   A  B  C  D  E  F  G  H"
print chess_board
puts "\n" * 2


green_square = "\u001b[48;5;107m"
      white_square = "\u001b[48;5;231m"
      empty_row_green = "#{green_square}   #{white_square}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{white_square}   #{green_square}   " * 4 + "\u001b[0m\n"
      printed_board = "8 #{empty_row_green}"\
                      "7 #{empty_row_white}"\
                      "6 #{empty_row_green}"\
                      "5 #{empty_row_white}"\
                      "4 #{empty_row_green}"\
                      "3 #{empty_row_white}"\
                      "2 #{empty_row_green}"\
                      "1 #{empty_row_white}"\
                      "   A  B  C  D  E  F  G  H"\
                      "\n"
                      print printed_board