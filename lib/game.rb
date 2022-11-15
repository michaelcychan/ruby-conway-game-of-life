require_relative 'board'
require_relative 'cell'

board = Board.new(Cell)
board.populate([[1,0], [1,1], [1,2], [3, 5], [4, 3], [4, 4], [4, 5], [5, 5]])

while true do
  system('clear')
  board.show_board.each do |row|
    print row
    print "\n"
  end
  
  print "\n\n\n"
  print "Press Ctrl + C to exit"

  sleep(0.5)
  
  board.next_round
end