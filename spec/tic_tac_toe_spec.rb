require './lib/board.rb'
require './lib/players.rb'

describe Board do
  let(:board) { Board.new }
  let(:displayed_board) { "\n . | . | . \n------------\n . | . | . \n------------\n . | . | . " }
  describe '#display' do
    it 'returns board of 3x3 filled with dots' do
      expect(board.display(['.', '.', '.', '.', '.', '.', '.', '.', '.'])).to eql(displayed_board)
    end
  end

  describe '#valid_move?(num)' do
    it 'returns true if argument is a number between 1 to 9 and false otherwise' do
      expect(board.valid_move?(3)).to eql(true)
    end
  end

  describe '#progress' do
    it 'returns assigns x or o if user chooses an number' do
      expect(board.progress(1, 'o')).to eql(board.board_data)
    end
  end
end

describe Players do
  let(:players) { Players.new(%w[player1_name symbol1], %w[player2_name symbol2]) }
  describe '#first_player' do
    it 'returns the player1_name' do
      expect(players.first_player).to eql('player1_name')
    end
  end

  describe '#second_player' do
    it 'returns the player1_name' do
      expect(players.second_player).to eql('player2_name')
    end
  end

  describe '#first_player_sign' do
    it 'returns the player1 symbol' do
      expect(players.first_player_sign).to eql('symbol1')
    end
  end

  describe '#second_player_sign' do
    it 'returns the player2 symbol' do
      expect(players.second_player_sign).to eql('symbol2')
    end
  end

  describe '#player_steps' do
    it 'appends count to the new array' do
      expect(players.player_steps([], 7)).to eql([7])
    end
  end

  describe '#game_status' do
    it 'returns nil while winner is not true' do
      expect(players.game_status).to eql(nil)
    end
  end
end
