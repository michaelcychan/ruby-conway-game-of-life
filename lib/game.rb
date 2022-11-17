require_relative 'board'
require_relative 'cell'

puts "Welcome to Conway's Game of Life"
user_input = " "
while !(user_input.match(/\d{1,2}/) && user_input.to_i >=6 && user_input.to_i <=20) do
  puts "Please enter a square board size (6 - 20): "
  user_input = gets.chomp
end 


board = Board.new(Cell, user_input.to_i)
board.populate([[1,0], [1,1], [1,2], [3, 5], [4, 3], [4, 4], [4, 5], [5, 5]])

while true do
  system('clear')
  board.show_board.each do |row|
    for i in 0..(row.length-1) do
      print row[i]
      print " "
    end
    print "\n"
  end
  
  print "\n\n\n"
  print "Press Ctrl + C to exit"

  sleep(1)
  
  board.next_round
end