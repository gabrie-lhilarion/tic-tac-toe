require './lib/board.rb'
require './lib/players.rb'

describe Board do
  board = Board.new
  describe '#display' do
    it 'returns board of 3x3 filled with dots' do     
      expect(board.display(['.', '.', '.', '.', '.', '.', '.', '.', '.'])).to eql()
    end
  end

  describe '#valid_move?(num)' do
    it 'returns true if argument is a number between 1 to 9 and false otherwise' do
      expect(board.valid_move?(3)).to eql(true)
    end
  end

  describe '#progress' do
    it 'returns assigns x or o if user chooses an number' do
      expect(board.progress(1, 'o')).to eql('o')
    end
  end

  describe '#old_view' do
    it 'returns the previous board' do
      expect(board.old_view).to eql()
    end
  end

  describe '#all_moves' do
    it 'returns total count of moves' do
      expect(board.all_moves).to eql()
    end
  end
end

describe Players do
  players = Players.new(['player1_name', 'symbol'], ['player2_name', 'symbol'])
end