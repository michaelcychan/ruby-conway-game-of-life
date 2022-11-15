require 'cell'

RSpec.describe 'Cell' do
  describe 'successfully initiate a Cell class instance' do
    it 'creates a cell object' do
      cell = Cell.new(1, 2)
      expect(cell).to be_a Cell
      expect(cell.get_pos()).to eq([1,2])
    end
  end
end