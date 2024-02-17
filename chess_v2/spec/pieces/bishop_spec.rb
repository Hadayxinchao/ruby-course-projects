# frozen_string_literal: true

require_relative '../../lib/pieces/bishop'
require_relative '../../lib/pieces/piece'
require_relative '../../lib/board'

RSpec.describe Bishop do
  let(:board) { instance_double(Board) }

  before do
    allow(board).to receive(:add_observer)
  end

  describe '#find_possible_moves' do
    let(:pic) { instance_double(Piece) }

    context 'when there are no spaces to move' do
      subject(:wbs) { described_class.new(board, { color: :white, location: [4, 0] }) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, pic, nil, nil, nil, nil, nil, nil],
          [wbs, nil, nil, nil, nil, nil, nil, nil],
          [nil, pic, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end

      it 'has no moves' do
        allow(board).to receive(:data).and_return(data)
        result = wbs.find_possible_moves(board)
        expect(result).to be_empty
      end
    end

    context 'when there are 3 empty diagonal spaces increasing rank' do
      subject(:bbs) { described_class.new(board, { color: :black, location: [0, 2] }) }
      let(:data) do
        [
          [nil, nil, bbs, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, pic, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end

      it 'has three moves' do
        allow(board).to receive(:data).and_return(data)
        result = bbs.find_possible_moves(board)
        expect(result).to contain_exactly([1, 1], [2, 0], [1, 3])
      end
    end

    context 'when there are 4 empty diagonal spaces decreasing rank' do
      subject(:wbs) { described_class.new(board, { color: :white, location: [7, 5] }) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, pic, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, wbs, nil, nil]
        ]
      end

      it 'has four moves' do
        allow(board).to receive(:data).and_return(data)
        result = wbs.find_possible_moves(board)
        expect(result).to contain_exactly([6, 4], [6, 6], [5, 3], [5, 7])
      end
    end

    context 'when the board is completely empty' do
      subject(:wbs) { described_class.new(board, { color: :white, location: [3, 3] }) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, wbs, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end

      it 'has thirteen moves' do
        allow(board).to receive(:data).and_return(data)
        result = wbs.find_possible_moves(board)
        expect(result).to contain_exactly([0, 0], [0, 6], [1, 1], [1, 5], [2, 2], [2, 4], [4, 2], [4, 4], [5, 1], [5, 5], [6, 0], [6, 6], [7, 7])
      end
    end
  end

  describe '#find_possible_captures' do
    let(:white_pic) { instance_double(Piece, color: :white) }
    let(:black_pic) { instance_double(Piece, color: :black) }

    context 'when there are no opposing pic to capture' do
      subject(:wbs) { described_class.new(board, { color: :white, location: [3, 3] }) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, white_pic, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, wbs, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, white_pic, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end

      it 'has no moves' do
        allow(board).to receive(:data).and_return(data)
        result = wbs.find_possible_captures(board)
        expect(result).to be_empty
      end
    end

    context 'when there are 1 opposing pic to capture decreasing rank' do
      subject(:wbs) { described_class.new(board, { color: :white, location: [7, 2] }) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [black_pic, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, white_pic, nil, nil, nil, nil],
          [nil, nil, wbs, nil, nil, nil, nil, nil]
        ]
      end

      it 'has one captures' do
        allow(board).to receive(:data).and_return(data)
        result = wbs.find_possible_captures(board)
        expect(result).to contain_exactly([5, 0])
      end
    end

    context 'when there are 2 opposing pics to capture increasing rank' do
      subject(:bbs) { described_class.new(board, { color: :black, location: [1, 3] }) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, bbs, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, white_pic, nil, nil],
          [white_pic, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end

      it 'has two captures' do
        allow(board).to receive(:data).and_return(data)
        result = bbs.find_possible_captures(board)
        expect(result).to contain_exactly([4, 0], [3, 5])
      end
    end
  end
end
