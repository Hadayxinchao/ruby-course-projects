# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/rook'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/piece'
require_relative '../lib/movement/basic_movement'
require_relative '../lib/movement/en_passant_movement'
require_relative '../lib/movement/pawn_promotion_movement'
require_relative '../lib/movement/castling_movement'

RSpec.describe Board do
  subject(:board) { described_class.new }

  describe '#initial_placement' do
    before do
      board.initial_placement
    end

    it 'has top row of black game pieces' do
      expect(board.data[0].all? { |piece| piece.color == :black }).to be true
    end

    it 'has second row of black game pieces' do
      expect(board.data[1].all? { |piece| piece.color == :black }).to be true
    end

    it 'has sixth row of white game pieces' do
      expect(board.data[6].all? { |piece| piece.color == :white }).to be true
    end

    it 'has bottom row of white game pieces' do
      expect(board.data[7].all? { |piece| piece.color == :white }).to be true
    end

    it 'has top row first Rook' do
      expect(board.data[0][0].instance_of?(Rook)).to be true
    end

    it 'has top row first Knight' do
      expect(board.data[0][1].instance_of?(Knight)).to be true
    end

    it 'has top row first Bishop' do
      expect(board.data[0][2].instance_of?(Bishop)).to be true
    end

    it 'has top row Queen' do
      expect(board.data[0][3].instance_of?(Queen)).to be true
    end

    it 'has top row King' do
      expect(board.data[0][4].instance_of?(King)).to be true
    end

    it 'has top row second Bishop' do
      expect(board.data[0][5].instance_of?(Bishop)).to be true
    end

    it 'has top rowsecond Knight' do
      expect(board.data[0][6].instance_of?(Knight)).to be true
    end

    it 'has top row second Rook' do
      expect(board.data[0][7].instance_of?(Rook)).to be true
    end

    it 'has second row of pawns' do
      expect(board.data[1].all? { |piece| piece.instance_of?(Pawn) }).to be true
    end

    it 'has sixth row of pawns' do
      expect(board.data[6].all? { |piece| piece.instance_of?(Pawn) }).to be true
    end

    it 'has bottom row first Rook' do
      expect(board.data[7][0].instance_of?(Rook)).to be true
    end

    it 'has bottom row first Knight' do
      expect(board.data[7][1].instance_of?(Knight)).to be true
    end

    it 'has bottom row first Bishop' do
      expect(board.data[7][2].instance_of?(Bishop)).to be true
    end

    it 'has bottom row Queen' do
      expect(board.data[7][3].instance_of?(Queen)).to be true
    end

    it 'has bottom row King' do
      expect(board.data[7][4].instance_of?(King)).to be true
    end

    it 'has bottom row second Bishop' do
      expect(board.data[7][5].instance_of?(Bishop)).to be true
    end

    it 'has bottom row second Knight' do
      expect(board.data[7][6].instance_of?(Knight)).to be true
    end

    it 'has bottom row second Rook' do
      expect(board.data[7][7].instance_of?(Rook)).to be true
    end
  end

  describe '#update_active_piece' do
    subject(:board) { described_class.new(data_update) }
    let(:data_update) { [[piece, nil], [nil, nil]] }
    let(:piece) { double(Piece, location: [0, 0]) }

    it 'updates active piece with coordinates' do
      coordinates = { row: 0, column: 0 }
      board.update_active_piece(coordinates)
      expect(board.active_piece).to eq(piece)
    end
  end

  describe '#active_piece_moveable?' do
    let(:piece) { double(Piece, location: [0, 0]) }
    let(:data) { [[piece, nil], [nil, nil]] }
    subject(:board) { described_class.new(data, { active_piece: data[0][0] }) }

    context 'when there is one current_move' do
      it 'returns true' do
        allow(piece).to receive(:moves).and_return([0, 1])
        allow(piece).to receive(:captures)
        allow(piece).to receive(:update)
        result = board.active_piece_moveable?
        expect(result).to be true
      end
    end

    context 'when there is one current_captures' do
      it 'returns true' do
        allow(piece).to receive(:moves).and_return([])
        allow(piece).to receive(:captures).and_return([1, 1])
        allow(piece).to receive(:update)
        result = board.active_piece_moveable?
        expect(result).to be true
      end
    end

    context 'when there is no current_move or current_capture' do
      it 'returns false' do
        allow(piece).to receive(:moves).and_return([])
        allow(piece).to receive(:captures).and_return([])
        allow(piece).to receive(:update)
        result = board.active_piece_moveable?
        expect(result).to be false
      end
    end
  end

  describe '#valid_piece_movement?' do
    context 'when coordinates matches a valid move' do
      let(:piece) { double(Piece, location: [0, 0]) }
      let(:data) { [[piece, nil], [nil, nil]] }
      subject(:board) { described_class.new(data, { active_piece: data[0][0] }) }

      it 'returns true' do
        allow(piece).to receive(:moves).and_return([[1, 0]])
        coordinates = { row: 1, column: 0 }
        result = board.valid_piece_movement?(coordinates)
        expect(result).to be true
      end
    end

    context 'when coordinates matches a valid capture' do
      let(:piece) { double(Piece, location: [0, 0]) }
      let(:data) { [[piece, nil], [nil, nil]] }
      subject(:board) { described_class.new(data, { active_piece: data[0][0] }) }

      it 'returns true' do
        allow(piece).to receive(:moves).and_return([])
        allow(piece).to receive(:captures).and_return([[1, 0]])
        coordinates = { row: 1, column: 0 }
        result = board.valid_piece_movement?(coordinates)
        expect(result).to be true
      end
    end

    context 'when coordinates does not matches valid move or capture' do
      let(:piece) { double(Piece, location: [0, 0]) }
      let(:data) { [[piece, nil], [nil, nil]] }
      subject(:board) { described_class.new(data, { active_piece: data[0][0] }) }

      it 'returns false' do
        allow(piece).to receive(:moves).and_return([])
        allow(piece).to receive(:captures).and_return([1, 0])
        coordinates = { row: 2, column: 0 }
        result = board.valid_piece_movement?(coordinates)
        expect(result).to be false
      end
    end
  end

  describe '#reset_board_values' do
    subject(:board) { described_class.new(data, { active_piece: data[0][0] }) }
    let(:data) { [[piece, nil], [nil, nil]] }
    let(:piece) { double(Piece, location: [0, 0]) }

    before do
      allow(board).to receive(:notify_observers)
    end

    it 'sets previous_piece to active_piece' do
      board.reset_board_values
      expect(board.previous_piece).to eq(piece)
    end

    it 'sets active_piece to nil' do
      board.reset_board_values
      expect(board.active_piece).to be_nil
    end

    it 'notifies the observers' do
      expect(board).to receive(:notify_observers)
      board.reset_board_values
    end
  end

  describe '#valid_piece?' do
    let(:piece) { instance_double(Piece, color: :white) }
    let(:data) { [[piece, nil], [nil, nil]] }
    subject(:board) { described_class.new(data, { active_piece: data[0][0] }) }

    context 'when coordinates is a piece of the right color' do
      it 'returns true' do
        coordinates = { row: 0, column: 0 }
        results = board.valid_piece?(coordinates, :white)
        expect(results).to be true
      end
    end

    context 'when coordinates is not a piece' do
      it 'returns false' do
        coordinates = { row: 1, column: 0 }
        results = board.valid_piece?(coordinates, :white)
        expect(results).to be false
      end
    end

    context 'when coordinates is a piece of the wrong color' do
      it 'returns false' do
        coordinates = { row: 0, column: 0 }
        results = board.valid_piece?(coordinates, :black)
        expect(results).to be false
      end
    end
  end

  describe '#update' do
    subject(:board) { described_class.new }
    let(:basic_movement) { instance_double(BasicMovement) }

    it 'sends #update_pieces to movement' do
      allow(board).to receive(:create_movement).and_return(basic_movement)
      coordinates = { row: 0, column: 0 }
      expect(basic_movement).to receive(:update_pieces).with(board, coordinates)
      board.update(coordinates)
    end
  end

  describe '#create_movement' do
    subject(:board) { described_class.new }

    context 'when there is an en passant capture' do
      it 'creates EnPassantMovement' do
        allow(board).to receive(:en_passant_capture?).and_return(true)
        expect(EnPassantMovement).to receive(:new)
        coordinates = { row: 0, column: 0 }
        board.create_movement(coordinates)
      end
    end

    context 'when there is a pawn promotion' do
      it 'creates PawnPromotionMovement' do
        allow(board).to receive(:en_passant_capture?).and_return(false)
        allow(board).to receive(:pawn_promotion?).and_return(true)
        expect(PawnPromotionMovement).to receive(:new)
        coordinates = { row: 0, column: 0 }
        board.create_movement(coordinates)
      end
    end

    context 'when there is an castling move' do
      it 'creates CastlingMovement' do
        allow(board).to receive(:en_passant_capture?).and_return(false)
        allow(board).to receive(:pawn_promotion?).and_return(false)
        allow(board).to receive(:castling?).and_return(true)
        expect(CastlingMovement).to receive(:new)
        coordinates = { row: 0, column: 0 }
        board.create_movement(coordinates)
      end
    end

    context 'when there are no special moves' do
      it 'creates BasicMovement' do
        allow(board).to receive(:en_passant_capture?).and_return(false)
        allow(board).to receive(:pawn_promotion?).and_return(false)
        allow(board).to receive(:castling?).and_return(false)
        expect(BasicMovement).to receive(:new)
        coordinates = { row: 0, column: 0 }
        board.create_movement(coordinates)
      end
    end
  end

  describe '#possible_en_passant?' do
    context 'when en_passant is possible' do
      let(:white_pawn) { instance_double(Pawn, color: :white, location: [4, 3], symbol: " \u265F ", en_passant: true) }
      let(:black_pawn) { instance_double(Pawn, color: :black, location: [4, 2], symbol: " \u265F ", en_passant: false) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, black_pawn, white_pawn, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end
      subject(:board) { described_class.new(data, { active_piece: data[4][2], previous_piece: data[4][3] }) }

      it 'returns true' do
        allow(black_pawn).to receive(:captures).and_return([[4, 3]])
        allow(black_pawn).to receive(:en_passant_rank?).and_return(true)
        result = board.possible_en_passant?
        expect(result).to be true
      end
    end

    context 'when en_passant is not possible' do
      let(:white_pawn) { instance_double(Pawn, color: :white, location: [4, 3], symbol: " \u265F ", en_passant: false) }
      let(:black_pawn) { instance_double(Pawn, color: :black, location: [4, 2], symbol: " \u265F ", en_passant: false) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, black_pawn, white_pawn, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end
      subject(:board) { described_class.new(data, { active_piece: data[4][2], previous_piece: data[4][3] }) }

      it 'returns false' do
        allow(black_pawn).to receive(:captures).and_return([[4, 3]])
        allow(black_pawn).to receive(:en_passant_rank?).and_return(true)
        result = board.possible_en_passant?
        expect(result).to be false
      end
    end

    context 'when en_passant is not possible' do
      let(:white_pawn) { instance_double(Pawn, color: :white, location: [4, 2], symbol: " \u265F ", en_passant: true) }
      let(:black_pawn) { instance_double(Pawn, color: :black, location: [3, 3], symbol: " \u265F ", en_passant: true) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, black_pawn, nil, nil, nil, nil],
          [nil, nil, white_pawn, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end
      subject(:board) { described_class.new(data, { active_piece: data[4][2], previous_piece: data[3][3] }) }

      it 'returns false' do
        allow(white_pawn).to receive(:captures).and_return([[3, 3]])
        allow(white_pawn).to receive(:en_passant_rank?).and_return(false)
        result = board.possible_en_passant?
        expect(result).to be false
      end
    end
  end

  describe '#king_in_check?' do
    context 'when king is in check' do
      subject(:board) { described_class.new(data, { white_king: data[7][4] }) }
      let(:black_queen) { instance_double(Queen, color: :black, location: [0, 4], captures: [[7, 4]]) }
      let(:white_king) { instance_double(King, color: :white, location: [7, 4]) }
      let(:data) do
        [
          [nil, nil, nil, nil, black_queen, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, white_king, nil, nil, nil]
        ]
      end

      it 'returns true' do
        result = board.king_in_check?(:white)
        expect(result).to be true
      end
    end

    context 'when king is not in check' do
      subject(:board) { described_class.new(data, { white_king: data[7][4] }) }
      let(:black_bishop) { instance_double(Bishop, color: :black, location: [0, 4], captures: [[1, 3], [2, 2]]) }
      let(:white_king) { instance_double(King, color: :white, location: [7, 4]) }
      let(:data) do
        [
          [nil, nil, nil, nil, black_bishop, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, white_king, nil, nil, nil]
        ]
      end

      it 'returns false' do
        result = board.king_in_check?(:white)
        expect(result).to be false
      end
    end
  end

  describe '#game_over?' do
    context 'when the game starts and there is no previous piece' do
      subject(:board) { described_class.new(data) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil]
        ]
      end

      it 'is not game over' do
        expect(board.game_over?).to be false
      end
    end

    context 'when king is not in check' do
      subject(:board) { described_class.new(data, { previous_piece: data[0][7], white_king: data[7][4] }) }
      let(:black_queen) { instance_double(Queen, color: :black, location: [0, 7], captures: []) }
      let(:white_king) { instance_double(King, color: :white, location: [7, 4], moves: [[7, 3], [7, 5]], captures: []) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, black_queen],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, white_king, nil, nil, nil]
        ]
      end

      it 'is not game over' do
        expect(board.game_over?).to be false
      end
    end

    context 'when king is in check & has legal moves' do
      subject(:board) { described_class.new(data, { previous_piece: data[0][4], white_king: data[7][4] }) }
      let(:black_queen) { instance_double(Queen, color: :black, location: [0, 4], captures: [[7, 4]]) }
      let(:white_king) { instance_double(King, color: :white, location: [7, 4], moves: [[7, 3], [7, 5]], captures: []) }
      let(:data) do
        [
          [nil, nil, nil, nil, black_queen, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, white_king, nil, nil, nil]
        ]
      end

      it 'is not game over' do
        expect(board.game_over?).to be false
      end
    end

    context 'when king is in check & does not have any legal moves' do
      subject(:board) { described_class.new(data, { previous_piece: data[7][0], white_king: data[7][4] }) }
      let(:bqn) { instance_double(Queen, color: :black, location: [7, 0], captures: [[7, 4]]) }
      let(:brk) { instance_double(Rook, color: :black, location: [6, 7], captures: []) }
      let(:wkg) { instance_double(King, color: :white, location: [7, 4], moves: [], captures: []) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, brk],
          [bqn, nil, nil, nil, wkg, nil, nil, nil]
        ]
      end

      it 'is game over' do
        expect(board.game_over?).to be true
      end
    end

    context 'when king is in stalemate & does not have any legal moves' do
      subject(:board) { described_class.new(data, { previous_piece: data[6][0], white_king: data[7][4] }) }
      let(:bqn) { instance_double(Queen, color: :black, location: [6, 0], moves: [[6, 1]], captures: []) }
      let(:br1) { instance_double(Rook, color: :black, location: [3, 2], moves: [[3, 1]], captures: []) }
      let(:br2) { instance_double(Rook, color: :black, location: [3, 4], moves: [[3, 5]], captures: []) }
      let(:wkg) { instance_double(King, color: :white, location: [7, 4], moves: [], captures: []) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, br1, nil, br2, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [bqn, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, wkg, nil, nil, nil]
        ]
      end

      it 'is game over' do
        expect(board.game_over?).to be true
      end
    end
  end

  describe '#possible_castling?' do
    context 'when castling is possible' do
      subject(:board) { described_class.new(data, { active_piece: data[7][4] }) }
      let(:wkg) { instance_double(King, color: :white, symbol: " \u265A ", location: [7, 4], moves: [[7, 5], [7, 6]]) }
      let(:wrk) { instance_double(Rook, color: :white, symbol: " \u265C ", moved: false, location: [7, 7]) }
      let(:wpc) { instance_double(Piece, color: :white) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, wpc, wpc, wpc, nil, nil],
          [nil, nil, nil, wpc, wkg, nil, nil, wrk]
        ]
      end

      it 'returns true' do
        result = board.possible_castling?
        expect(result).to be true
      end
    end

    context 'when castling is not possible' do
      subject(:board) { described_class.new(data, { active_piece: data[7][4] }) }
      subject(:wr1) { instance_double(King, color: :white, symbol: " \u265C ", location: [7, 4], moves: [[7, 5], [7, 6]]) }
      let(:wr2) { instance_double(Rook, color: :white, symbol: " \u265C ", moved: false, location: [7, 7]) }
      let(:wpc) { instance_double(Piece, color: :white) }
      let(:data) do
        [
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, nil, nil, nil, nil, nil],
          [nil, nil, nil, wpc, wpc, wpc, nil, nil],
          [nil, nil, nil, wpc, wr1, nil, nil, wr2]
        ]
      end

      it 'returns false' do
        result = board.possible_castling?
        expect(result).to be false
      end
    end
  end

  describe '#random_black_piece' do
    subject(:random_board) { described_class.new(random_data) }
    let(:wpc) { instance_double(Piece, color: :white, location: [7, 1]) }
    let(:bpc) { instance_double(Piece, color: :black, location: [0, 1], moves: [], captures: []) }
    let(:bkg) { instance_double(Piece, color: :black, location: [1, 6], moves: [], captures: [[7, 1]]) }
    let(:bqn) { instance_double(Piece, color: :black, location: [2, 6], moves: [[3, 6]], captures: []) }
    let(:random_data) do
      [
        [nil, bpc, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, bkg, nil],
        [nil, nil, nil, nil, nil, nil, bqn, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, wpc, nil, nil, nil, nil, nil, nil]
      ]
    end

    it 'returns the location of a piece with moves' do
      result = random_board.random_black_piece
      possibilities = [{ row: 1, column: 6 }, { row: 2, column: 6 }]
      expect(possibilities).to include(result)
    end
  end

  describe '#random_black_move' do
    subject(:board) { described_class.new(data, { active_piece: data[0][1] }) }
    let(:black_queen) { instance_double(Piece, moves: [[0, 0], [0, 2], [0, 3]], captures: [[1, 0]]) }
    let(:data) { [[nil, black_queen, nil, nil], [nil, nil, nil, nil]] }

    it 'returns random coordinates of active black piece' do
      result = board.random_black_move
      possibilities = [{ row: 0, column: 0 }, { row: 0, column: 2 }, { row: 0, column: 3 }, { row: 1, column: 0 }]
      expect(possibilities).to include(result)
    end
  end

  describe '#update_game_mode' do
    subject(:board) { described_class.new }

    it 'updates value of game_mode to :computer' do
      board.update_mode
      expect(board.mode).to eq(:computer)
    end
  end
end