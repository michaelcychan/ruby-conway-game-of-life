require 'cell'

RSpec.describe 'Cell' do
  describe 'successfully initiate a Cell class instance' do
    it 'creates a cell object and is dead' do
      cell = Cell.new()
      expect(cell).to be_a Cell
      expect(cell.get_status()).to eq('💀')
    end
  end
  describe 'funcationalities' do
    it 'makes a cell alive' do
      cell = Cell.new()
      cell.make_alive()
      expect(cell.get_status()).to eq('🐣')
    end
    it 'kills a cell' do
      cell = Cell.new()
      cell.make_alive()
      cell.kill_cell()
      expect(cell.get_status()).to eq('💀')
    end
  end
end