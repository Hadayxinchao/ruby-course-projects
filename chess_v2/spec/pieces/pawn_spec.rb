# frozen_string_literal: true

require_relative '../../lib/pieces/pawn'
require_relative '../../lib/pieces/piece'

RSpec.describe Pawn do
  # describe '#update_moves' do
  #   context 'when pawn is black' do
  #     subject(:black_pawn) { described_class.new({ color: :black, location: [1, 0] }) }

  #     context 'when pawn has not moved' do
  #       it 'has two moves' do
  #         black_pawn.update_moves(1)
  #         expect(black_pawn.moves).to contain_exactly([2, 0], [3, 0])
  #       end
  #     end

  #     context 'when pawn has moved' do
  #       it 'has one move' do
  #         black_pawn.update_location(2, 0)
  #         black_pawn.update_moves(1)
  #         expect(black_pawn.moves).to contain_exactly([3, 0])
  #       end
  #     end
  #   end

  #   context 'when pawn is white' do
  #     subject(:white_pawn) { described_class.new({ color: :white, location: [6, 0] }) }

  #     context 'when pawn has not moved' do
  #       it 'has two moves' do
  #         white_pawn.update_moves(-1)
  #         expect(white_pawn.moves).to contain_exactly([5, 0], [4, 0])
  #       end
  #     end

  #     context 'when pawn has moved' do
  #       it 'has one move' do
  #         white_pawn.update_location(5, 0)
  #         white_pawn.update_moves(-1)
  #         expect(white_pawn.moves).to contain_exactly([4, 0])
  #       end
  #     end
  #   end
  # end

  # describe '#update_captures' do
  #   context 'when pawn is black' do
  #     context 'when pawn is in the middle of the board' do
  #       subject(:black_pawn) { described_class.new({ color: :black, location: [1, 4] }) }

  #       it 'has two captures' do
  #         black_pawn.update_captures
  #         expect(black_pawn.captures).to contain_exactly([2, 3], [2, 5])
  #       end
  #     end

  #     context 'when pawn is on the edge of the board' do
  #       subject(:black_pawn) { described_class.new({ color: :black, location: [1, 0] }) }

  #       it 'has one capture' do
  #         black_pawn.update_captures
  #         expect(black_pawn.captures).to contain_exactly([2, 1])
  #       end
  #     end

  #     context 'when pawn is in the middle of the board' do
  #       subject(:black_pawn) { described_class.new({ color: :black, location: [1, 7] }) }

  #       it 'has one capture' do
  #         black_pawn.update_captures
  #         expect(black_pawn.captures).to contain_exactly([2, 6])
  #       end
  #     end
  #   end

  #   context 'when pawn is white' do
  #     context 'when pawn is in the middle of the board' do
  #       subject(:white_pawn) { described_class.new({ color: :white, location: [6, 3] }) }

  #       it 'has two captures' do
  #         white_pawn.update_captures
  #         expect(white_pawn.captures).to contain_exactly([5, 2], [5, 4])
  #       end
  #     end

  #     context 'when pawn is on the edge of the board' do
  #       subject(:white_pawn) { described_class.new({ color: :white, location: [6, 0] }) }

  #       it 'has one capture' do
  #         white_pawn.update_captures
  #         expect(white_pawn.captures).to contain_exactly([5, 1])
  #       end
  #     end

  #     context 'when pawn is in the middle of the board' do
  #       subject(:white_pawn) { described_class.new({ color: :white, location: [6, 7] }) }

  #       it 'has one capture' do
  #         white_pawn.update_captures
  #         expect(white_pawn.captures).to contain_exactly([5, 6])
  #       end
  #     end
  #   end
  # end

  describe '#current_moves' do
    context 'when pawn is black' do
      context 'when pawn has not moved' do
        subject(:black_pawn) { described_class.new({ color: :black, location: [1, 0] }) }

        context 'when bonus square is empty' do
          let(:board) { [[nil, nil], [black_pawn, nil], [nil, nil], [nil, nil]] }

          it 'has two moves' do
            results = black_pawn.current_moves(board)
            expect(results).to contain_exactly([2, 0], [3, 0])
          end
        end

        context 'when bonus square is occupied' do
          let(:piece) { instance_double(Piece) }
          let(:board_occupied) { [[nil, nil], [black_pawn, nil], [nil, nil], [piece, nil]] }

          it 'has one move' do
            results = black_pawn.current_moves(board_occupied)
            expect(results).to contain_exactly([2, 0])
          end
        end
      end

      context 'when pawn has moved' do
        subject(:black_pawn) { described_class.new({ color: :black, location: [1, 0] }) }

        before do
          black_pawn.update_location(2, 0)
        end

        context 'when next square is empty' do
          let(:board) { [[nil, nil], [black_pawn, nil], [nil, nil], [nil, nil]] }

          it 'has one move' do
            results = black_pawn.current_moves(board)
            expect(results).to contain_exactly([3, 0])
          end
        end

        context 'when next square is occupied' do
          let(:piece) { instance_double(Piece) }
          let(:board_occupied) { [[nil, nil], [black_pawn, nil], [nil, nil], [piece, nil]] }

          it 'has no moves' do
            results = black_pawn.current_moves(board_occupied)
            expect(results).to be_empty
          end
        end
      end
    end

    context 'when pawn is white' do
      context 'when pawn has not moved' do
        subject(:white_pawn) { described_class.new({ color: :white, location: [2, 0] }) }
        context 'when bonus square is empty' do
          let(:board) { [[nil, nil], [nil, nil], [white_pawn, nil], [nil, nil]] }

          it 'has two moves' do
            results = white_pawn.current_moves(board)
            expect(results).to contain_exactly([0, 0], [1, 0])
          end

          context 'when bonus square is occupied' do
            let(:piece) { instance_double(Piece) }
            let(:board_bonus) { [[nil, nil], [white_pawn, nil], [nil, nil], [piece, nil]] }
  
            it 'has one move' do
              results = white_pawn.current_moves(board_bonus)
              expect(results).to contain_exactly([0, 0])
            end
          end
        end

        context 'when pawn has moved' do
          subject(:white_pawn) { described_class.new({ color: :white, location: [2, 0] }) }

          before do
            white_pawn.update_location(1, 0)
          end

          context 'when next square is empty' do
            let(:board) { [[nil, nil], [nil, nil], [white_pawn, nil], [nil, nil]] }
  
            it 'has one move' do
              results = white_pawn.current_moves(board)
              expect(results).to contain_exactly([0, 0])
            end
          end
  
          context 'when next square is occupied' do
            let(:piece) { instance_double(Piece) }
            let(:board_occupied) { [[piece, nil], [nil, nil], [white_pawn, nil], [nil, nil]] }
  
            it 'has no moves' do
              results = white_pawn.current_moves(board_occupied)
              expect(results).to be_empty
            end
          end
        end
      end
    end
  end
end
