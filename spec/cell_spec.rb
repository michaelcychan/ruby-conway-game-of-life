require 'cell'

RSpec.describe 'Cell' do
  describe 'successfully initiate a Cell class instance' do
    it 'creates a cell object' do
      cell = Cell.new
      expect(cell).to be_a Cell
    end
  end
end