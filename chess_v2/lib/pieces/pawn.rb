# frozen_string_literal: true

require_relative 'piece'

# logic for each chess piece
class Pawn < Piece
  attr_reader :symbol, :color, :moves, :location, :captures

  def initialize(args)
    super(args)
    @symbol = " \u265F "
    @location = args[:location]
    @moved = false
  end

  # Tested
  def current_moves(board)
    moves = []
    rank = @location[0] + rank_direction
    file = @location[1]
    moves << [rank, file] unless board[rank][file]
    bonus = first_move_bonus
    moves << bonus unless @moved || board[bonus[0]][bonus[1]]
    moves
  end

  # Tested
  def current_captures(board)
    captures = []
    rank = @location[0] + rank_direction
    file = @location[1]
    lower_file = file - 1
    higher_file = file + 1
    captures << [rank, lower_file] if opposing_piece?(rank, lower_file, board)
    captures << [rank, higher_file] if opposing_piece?(rank, higher_file, board)
    captures
  end

  private

  def first_move_bonus
    double_rank = @location[0] + (rank_direction * 2)
    file = @location[1]
    [double_rank, file]
  end

  def rank_direction
    color == :white ? -1 : 1
  end
end
