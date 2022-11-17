require_relative 'board'
require_relative 'cell'

puts "Welcome to Conway's Game of Life"
user_input = " "
while !(user_input.match(/\d{1,2}/) && user_input.to_i >=6 && user_input.to_i <=20) do
  puts "Please enter a square board size (6 - 20): "
  user_input = gets.chomp
end 

board = Board.new(Cell, user_input.to_i)



hash1 = {
  1=> [[1,0], [1,1], [1,2]],
  2=> [[0,0], [1,1], [1,2], [2,0], [2,1]],
  3=> [[1,0], [1,1], [1,2], [3, 5], [4, 3], [4, 4], [4, 5], [5, 5]]
}

puts "Please choose from 1 to 3:"
puts "1 - stationay oscillation"
puts "2 - moving oscillation"
puts "3 - a not so random pattern"

user_input = ""
while !(user_input.match(/\d{1}/) && user_input.to_i >=1 && user_input.to_i <=3) do
  puts "Please enter a your selection: "
  user_input = gets.chomp
end 


board.populate(hash1[user_input.to_i])

# Oscillation:
# [[1,0], [1,1], [1,2]]

# Moving Oscillation:
# [[0,0], [1,1], [1,2], [2,0], [2,1]]

# Custom
# [[1,0], [1,1], [1,2], [3, 5], [4, 3], [4, 4], [4, 5], [5, 5]]

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