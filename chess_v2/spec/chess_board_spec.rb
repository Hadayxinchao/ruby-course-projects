require_relative '../lib/chess_board'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/pawn'

RSpec.describe ChessBoard do
  describe '#initial_placement' do
    subject(:board) { described_class.new }

    before do
      board.initial_placement
    end

    it 'has top row of black game pieces' do
      expect(board.board[0].all? { |piece| piece.color == :black }).to be true
    end

    it 'has second row of black game pieces' do
      expect(board.board[1].all? { |piece| piece.color == :black }).to be true
    end

    it 'has sixth row of white game pieces' do
      expect(board.board[6].all? { |piece| piece.color == :white }).to be true
    end

    it 'has bottom row of white game pieces' do
      expect(board.board[7].all? { |piece| piece.color == :white }).to be true
    end

    it 'has top row first Rook' do
      expect(board.board[0][0].instance_of?(Rook)).to be true
    end

    it 'has top row first Knight' do
      expect(board.board[0][1].instance_of?(Knight)).to be true
    end

    it 'has top row first Bishop' do
      expect(board.board[0][2].instance_of?(Bishop)).to be true
    end

    it 'has top row Queen' do
      expect(board.board[0][3].instance_of?(Queen)).to be true
    end

    it 'has top row King' do
      expect(board.board[0][4].instance_of?(King)).to be true
    end

    it 'has top row second Bishop' do
      expect(board.board[0][5].instance_of?(Bishop)).to be true
    end

    it 'has top rowsecond Knight' do
      expect(board.board[0][6].instance_of?(Knight)).to be true
    end

    it 'has top row second Rook' do
      expect(board.board[0][7].instance_of?(Rook)).to be true
    end

    it 'has second row of pawns' do
      expect(board.board[1].all? { |piece| piece.instance_of?(Pawn) }).to be true
    end

    it 'has sixth row of pawns' do
      expect(board.board[6].all? { |piece| piece.instance_of?(Pawn) }).to be true
    end

    it 'has bottom row first Rook' do
      expect(board.board[7][0].instance_of?(Rook)).to be true
    end

    it 'has bottom row first Knight' do
      expect(board.board[7][1].instance_of?(Knight)).to be true
    end

    it 'has bottom row first Bishop' do
      expect(board.board[7][2].instance_of?(Bishop)).to be true
    end

    it 'has bottom row Queen' do
      expect(board.board[7][3].instance_of?(Queen)).to be true
    end

    it 'has bottom row King' do
      expect(board.board[7][4].instance_of?(King)).to be true
    end

    it 'has bottom row second Bishop' do
      expect(board.board[7][5].instance_of?(Bishop)).to be true
    end

    it 'has bottom row second Knight' do
      expect(board.board[7][6].instance_of?(Knight)).to be true
    end

    it 'has bottom row second Rook' do
      expect(board.board[7][7].instance_of?(Rook)).to be true
    end
  end
end