require 'tdd_connect_four'

describe ConnectFour do
  let(:game) { described_class.new }
  
  describe "#initialize" do
    it 'creates a 6x7 empty board' do
      expect(game.board.length).to eq(6)
      expect(game.board.all? { |row| row.length == 7 && row.all?(' ') }).to be true
    end
  end

  describe "#drop_piece" do
    context "when dropping piece in an empty column" do
      it "places the piece at the bottom of the collumn" do
        game.drop_piece(2, "X")
        expect(game.board[5][2]).to eq("X")
      end
    end

    context "when dropping a piece in non-empty column" do
      it "places the piece on top of the existing pieces" do
        game.drop_piece(3, 'O')
        game.drop_piece(3, 'X')
        expect(game.board[5][3]).to eq('O')
        expect(game.board[4][3]).to eq('X')
      end
    end

    context "when dropping a piece in a full column" do
      it 'raise an error' do
        6.times { game.drop_piece(4, 'X') }
        expect { game.drop_piece(4, 'O') }.to raise_error('Column is full')
      end
    end
  end

  describe "#display_board" do
    it 'print the current state of the board' do
      expect { game.display_board }.to output(/.*\|.*\|.*\|.*\|.*\|.*\|.*\n/).to_stdout
    end
  end

  describe "#valid_move?" do 
    it 'return true for a valid move' do
      expect(game.send(:valid_move?, 3)).to be true
    end

    it 'return false for an invalid move (out of bounds)' do
      expect(game.send(:valid_move?, -1)).to be false
      expect(game.send(:valid_move?, 7)).to be false
    end

    it 'return false for an invalid move (full column)' do
      6.times { game.drop_piece(3, 'X') }
      expect(game.send(:valid_move?, 3)).to be false
    end
  end
end



