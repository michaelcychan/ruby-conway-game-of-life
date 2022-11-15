class Board
  def initialize(cell_class)
    @board = Array.new(8).map{ |x| Array.new(8).map{|y| cell_class.new()}}
  end

  def get_board
    @board
  end

  def show_board
    return @board.map do | row|
      row.map do | cell |
        cell.get_status
      end
    end
  end

  def print_board
    @board.each do |row|
      print row.join('')
    end
  end

  def populate(cells_pos)
    cells_pos.each do |cell_pos|
      @board[cell_pos[0]][cell_pos[1]].make_alive()
    end
  end

  def count_living_neighbours(pos)
    living_neighbour = 0
    x_start = pos[0] == 0 ? 0 : pos[0] - 1
    x_end = pos[0] == 7 ? 7 :  pos[0] + 1
    y_start = pos[1] == 0 ? 0 : pos[1] - 1
    y_end = pos[1] == 7 ? 7 :  pos[1] + 1
    for x in x_start..x_end do
      for y in y_start..y_end do
        if !(pos[0] == x && pos[1] == y)
          if @board[x][y].get_status == '🐣'
            living_neighbour += 1
          end
        end
      end
    end
    living_neighbour
  end

  def next_round
    temp_array = Array.new(8).map{ |x| Array.new(8)}
    for x in (0..7) do
      for y in (0..7) do
        temp_array[x][y] = self.set_cell_next_status(x, y)
      end
    end
    for xx in 0..7 do
      for yy in 0..7 do
        if temp_array[xx][yy]
          @board[xx][yy].make_alive
        else
          @board[xx][yy].kill_cell
        end
      end
    end
  end

  def set_cell_next_status(x,y)
    alive_neighbours = self.count_living_neighbours([x,y])
    if @board[x][y].get_status == '🐣'
      if alive_neighbours == 2 || alive_neighbours == 3
        return true
      else
        return false
      end
    else
      if alive_neighbours == 3
        return true
      else
        return false
      end
    end
  end
end