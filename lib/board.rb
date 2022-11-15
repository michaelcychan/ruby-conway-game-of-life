class Board
  def initialize(cell_class)
    @board = Array.new(8).map{ |x| Array.new(8).map{|y| cell_class.new()}}
  end

  def get_board()
    @board
  end

  def show_board()
    return @board.map do | row|
      row.map do | cell |
        cell.get_status
      end
    end
  end

  def populate(cells_pos)
    cells_pos.each do |cell_pos|
      @board[cell_pos[0]][cell_pos[1]].make_alive()
    end
  end

end