class Cell
  def initialize
    @status = '💀'
  end

  def get_status
    return @status
  end

  def make_alive
    @status = '🐣'
  end

  def kill_cell
    @status = '💀'
  end

end
