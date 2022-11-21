class Display
  def self.init_greet
    puts "Welcome to Conway's Game of Life"
  end

  def self.print_board(input_2d_array)
    input_2d_array.each do |row|
      for i in 0..(row.length - 1) do
        print row[i]
        print " "
      end
      print "\n"
    end  
  end

  def self.print_screen_end
    print "\n\n\n"
    print "Press Ctrl + C to exit" 
  end

end
