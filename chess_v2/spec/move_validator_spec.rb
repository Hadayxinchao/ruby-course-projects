require_relative '../lib/move_validator'
require_relative '../lib/board'
require_relative '../lib/pieces/piece'

RSpec.describe MoveValidator do
  require 'pry'
  subject(:validator) { described_class.new(black_queen, board, [[1, 4], [3, 4], [4, 4], [5, 4], [2, 5]]) }
  let(:black_queen) { instance_double(Piece, location: [2, 4], color: :black) }
  let(:black_king) { instance_double(Piece, location: [0, 4], color: :black) }
  let(:white_queen) { instance_double(Piece, location: [6, 4], color: :white) }
  let(:board) { instance_double(Board) }
  let(:data) do
    [
      [nil, nil, nil, nil, black_king, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, black_queen, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, white_queen, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil]
    ]
  end

  before do
    allow(board).to receive(:data).and_return(data)
    allow(board).to receive(:black_king).and_return(black_king)
    allow(board).to receive(:white_king).and_return(nil)
  end

  describe '#run_possibilities' do
    it 'returns' do
      result = validator.run_possibilities
      expect(result).to contain_exactly([1, 4], [3, 4], [4, 4], [5, 4])
    end
  end
end