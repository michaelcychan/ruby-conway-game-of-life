require 'board'

class FakeCell

end

RSpec.describe 'Board' do
  describe 'successfully initiate board' do
    it 'creates a board with a size of 8 x 8' do

      board = Board.new(FakeCell, 8)
      expect(board).to be_a Board

      cell_counter = 0
      board.get_board().flatten().each do |element|
        if element.is_a? FakeCell
          cell_counter += 1
        end
      end
      expect(cell_counter).to eq(64)
    end

    it 'creates a board with a size of 20 x 20' do

      board = Board.new(FakeCell, 20)
      expect(board).to be_a Board

      cell_counter = 0
      board.get_board().flatten().each do |element|
        if element.is_a? FakeCell
          cell_counter += 1
        end
      end
      expect(cell_counter).to eq(400)
    end
  end
end