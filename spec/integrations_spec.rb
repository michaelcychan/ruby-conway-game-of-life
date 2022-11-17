require 'board'
require 'cell'

RSpec.describe 'Integration Tests' do
  describe 'successfully initiate board' do
    it 'creates a board with dead cells' do
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

      board = Board.new(Cell, 8)
      expect(board).to be_a Board
      expect(board.show_board()).to eq(expected_board)
    end

    it 'fills board with one cell' do
      board = Board.new(Cell, 8)
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
      board = Board.new(Cell, 8)
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
    it 'can count the living neighbours' do
      board = Board.new(Cell, 8)
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
      expect(board.count_living_neighbours([3,4])).to eq(3)
      expect(board.count_living_neighbours([0,0])).to eq(0)
      expect(board.count_living_neighbours([0,3])).to eq(0)
      expect(board.count_living_neighbours([4,3])).to eq(2)
      expect(board.count_living_neighbours([4,4])).to eq(4)
      expect(board.count_living_neighbours([4,5])).to eq(4)
      expect(board.count_living_neighbours([5,5])).to eq(1)
      expect(board.count_living_neighbours([7,7])).to eq(0)
    end
    it 'can change living and dead cells according to rule', focus: true do
      board = Board.new(Cell, 8)
      board.populate([[3, 4], [3, 5], [4, 3], [4, 4], [4, 5], [5, 5]])
      expected_board_array_begin = [
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 0
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 1
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 2
        ['💀', '💀', '💀', '💀', '🐣', '🐣', '💀', '💀'], # 3
        ['💀', '💀', '💀', '🐣', '🐣', '🐣', '💀', '💀'], # 4
        ['💀', '💀', '💀', '💀', '💀', '🐣', '💀', '💀'], # 5
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 6
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 7
      ]
      expect(board.show_board).to eq(expected_board_array_begin)
      board.next_round()
      expected_board_array_next = [
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 0
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 1
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 2
        ['💀', '💀', '💀', '🐣', '💀', '🐣', '💀', '💀'], # 3
        ['💀', '💀', '💀', '🐣', '💀', '💀', '🐣', '💀'], # 4
        ['💀', '💀', '💀', '💀', '💀', '🐣', '💀', '💀'], # 5
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 6
        ['💀', '💀', '💀', '💀', '💀', '💀', '💀', '💀'], # 7
      ]
      expect(board.show_board[0]).to eq(expected_board_array_next[0])
      expect(board.show_board[1]).to eq(expected_board_array_next[1])
      expect(board.show_board[2]).to eq(expected_board_array_next[2])
      expect(board.show_board[3]).to eq(expected_board_array_next[3])
      expect(board.show_board[4]).to eq(expected_board_array_next[4])
      expect(board.show_board[5]).to eq(expected_board_array_next[5])
      expect(board.show_board[6]).to eq(expected_board_array_next[6])
      expect(board.show_board[7]).to eq(expected_board_array_next[7])
    end
  end
end