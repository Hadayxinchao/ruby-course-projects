# frozen_string_literal: true

require_relative '../../lib/movement/castling_movement'
require_relative '../../lib/movement/basic_movement'
require_relative '../../lib/board'
require_relative '../../lib/pieces/piece'

RSpec.describe CastlingMovement do
  describe '#update_pieces' do
    subject(:movement) { described_class.new }
    let(:board) { instance_double(Board) }
    let(:black_king) { instance_double(Piece, location: [0, 4]) }
    let(:black_rook) { instance_double(Piece, location: [0, 7]) }
    let(:data) do
      [
        [nil, nil, nil, nil, black_king, nil, nil, black_rook],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
    end
    before do
      allow(board).to receive(:data).and_return(data)
      allow(board).to receive(:active_piece).and_return(black_king)
      allow(black_king).to receive(:update_location).with(0, 6)
      allow(black_rook).to receive(:update_location).with(0, 5)
      coordinates = { row: 0, column: 6 }
      movement.update_pieces(board, coordinates)
    end

    it 'updates the board' do
      expect(movement.board).to eq(board)
    end

    it 'updates the row' do
      expect(movement.row).to eq(0)
    end

    it 'updates the column' do
      expect(movement.column).to eq(6)
    end

    it 'calls #update_castling_moves' do
      expect(movement).to receive(:update_castling_moves)
      coordinates = { row: 0, column: 6 }
      movement.update_pieces(board, coordinates)
    end

    # it 'updates new coordinates with king' do
    #   coordinates = { row: 0, column: 6 }
    #   movement.update_pieces(board, coordinates)
    #   expect(movement.board.data[0][6]).to eq(black_king)
    # end

    # it 'removes king from original location' do
    #   coordinates = { row: 0, column: 6 }
    #   movement.update_pieces(board, coordinates)
    #   expect(movement.board.data[0][4]).to be nil
    # end

    # it 'sends #update_location (with coords) to king' do
    #   expect(black_king).to receive(:update_location).with(0, 6)
    #   coordinates = { row: 0, column: 6 }
    #   movement.update_pieces(board, coordinates)
    # end

    # it 'removes rook from original location' do
    #   coordinates = { row: 0, column: 6 }
    #   movement.update_pieces(board, coordinates)
    #   expect(movement.board.data[0][7]).to be nil
    # end

    # it 'updates castling coordinates with rook' do
    #   coordinates = { row: 0, column: 6 }
    #   movement.update_pieces(board, coordinates)
    #   expect(movement.board.data[0][5]).to eq(black_rook)
    # end

    # it 'sends #update_location (with castling coords) to rook' do
    #   expect(black_rook).to receive(:update_location).with(0, 5)
    #   coordinates = { row: 0, column: 6 }
    #   movement.update_pieces(board, coordinates)
    # end
  end

  describe '#find_castling_rook' do
    subject(:movement) { described_class.new(board, 0, 6) }
    let(:board) { instance_double(Board) }
    let(:black_king) { instance_double(Piece, location: [0, 4]) }
    let(:black_rook) { instance_double(Piece, location: [0, 7]) }
    let(:data) do
      [
        [nil, nil, nil, nil, black_king, nil, nil, black_rook],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
    end

    it 'returns rook that can castle' do
      allow(board).to receive(:data).and_return(data)
      allow(board).to receive(:active_piece).and_return(black_king)
      result = movement.find_castling_rook
      expect(result).to be(black_rook)
    end
  end

  describe '#remove_original_rook_piece' do
    subject(:movement) { described_class.new(board, 0, 6) }
    let(:board) { instance_double(Board) }
    let(:black_king) { instance_double(Piece, location: [0, 4]) }
    let(:black_rook) { instance_double(Piece, location: [0, 7]) }
    let(:data) do
      [
        [nil, nil, nil, nil, black_king, nil, nil, black_rook],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
    end

    it 'updates location of the old rook piece' do
      allow(board).to receive(:data).and_return(data)
      allow(board).to receive(:active_piece).and_return(black_king)
      movement.remove_original_rook_piece
      old_location = movement.board.data[0][7]
      expect(old_location).to be nil
    end
  end

  describe '#update_castling_coordinates' do
    subject(:movement) { described_class.new(board, 0, 6) }
    let(:board) { instance_double(Board) }
    let(:black_king) { instance_double(Piece, location: [0, 4]) }
    let(:black_rook) { instance_double(Piece, location: [0, 7]) }
    let(:data) do
      [
        [nil, nil, nil, nil, black_king, nil, nil, black_rook],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
    end

    it 'updates location of the new rook piece' do
      allow(board).to receive(:data).and_return(data)
      allow(board).to receive(:active_piece).and_return(black_king)
      movement.update_castling_coordinates(black_rook)
      new_location = movement.board.data[0][5]
      expect(new_location).to be(black_rook)
    end
  end

  describe '#update_castling_piece_location' do
    subject(:movement) { described_class.new(board, 0, 6) }
    let(:board) { instance_double(Board) }
    let(:black_king) { instance_double(Piece, location: [0, 4]) }
    let(:black_rook) { instance_double(Piece, location: [0, 7]) }
    let(:data) do
      [
        [nil, nil, nil, nil, black_king, nil, nil, black_rook],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil]
      ]
    end

    it 'updates location of the new rook piece' do
      allow(board).to receive(:data).and_return(data)
      allow(board).to receive(:active_piece).and_return(black_king)
      expect(black_rook).to receive(:update_location).with(0, 5)
      movement.update_castling_piece_location(black_rook)
    end
  end
end