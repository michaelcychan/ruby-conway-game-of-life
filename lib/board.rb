class Board
  def initialize()
    @board = Array.new(8).map{ |x| Array.new(8, '💀')}
  end

  def show_board()
    return @board
  end

  def populate(cells_pos)
    cells_pos.each do |cell_pos|
      @board[cell_pos[0]][cell_pos[1]] = '🐣'
    end
  end

  
end