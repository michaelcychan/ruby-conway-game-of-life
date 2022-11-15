require 'board'

RSpec.describe 'Board' do
  describe 'successfully initiate board' do
    it 'creates a board with a size of 8 x 8' do
      expected_board = [
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
      ]

      board = Board.new
      expect(board).to be_a Board
      expect(board.show_board()).to eq(expected_board)
    end

    it 'fills board with one cell' do
      board = Board.new
      board.populate([[0,0]])
      expected_board_array = [
        ['🐣', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
      ]
      expect(board.show_board()).to eq(expected_board_array)
    end

    it 'fills board with cells at assigned positions' do
      board = Board.new
      board.populate([[0,0], [3, 4], [3, 5], [4, 3], [4, 4], [5, 5]])
      expected_board_array = [
        ['🐣', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '🐣', '🐣', '💀', '💀'],
        ['💀', '💀', '💀', '🐣', '🐣', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '🐣', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
      ]
      expect(board.show_board()).to eq(expected_board_array)
    end
  end
  describe 'game progressing' do
    it 'can check if a spot will live or die on next turn' do
      board = Board.new
      board.populate([[3, 4], [3, 5], [4, 3], [4, 4], [5, 5]])
      expected_board_array = [
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '🐣', '🐣', '💀', '💀'],
        ['💀', '💀', '💀', '🐣', '🐣', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '🐣', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'],
      ]
    end
  end
end