# frozen_string_literal: true

require_relative 'piece'

# logic for each chess piece
class Pawn < Piece
  attr_reader :symbol, :color, :moves, :location, :captures

  def initialize(args)
    super(args)
    @symbol = " \u265F "
    @location = args[:location]
    @moves = []
    @captures = []
    @moved = false
  end

  # Tested
  # add valid move for en passant
  def update_moves(movement)
    # Should only work if there is not a piece in the spot
    @moves = []
    @moves << [@location[0] + movement, @location[1]]
    additional_new_move(movement * 2) unless @moved
    # additional new move (movement x 2)
    # new_moves
  end

  # Can this be split up to 2 methods
  # Tested ???
  def update_captures(movement)
    @captures = []
    row = @location[0]
    column = @location[1]
    @captures << [row + movement, column - 1] if column >= 1
    @captures << [row + movement, column + 1] if column <= 6
  end

  # Need to Test
  def update_moves_captures
    update_moves(rank_direction)
    update_captures(rank_direction)
  end

  def current_moves(board)
    moves = []
    rank = @location[0] + rank_direction
    file = @location[1]
    moves << [rank, file] unless board[rank][file]
    moves << first_move_bonus(board) unless @moved
    moves
  end

  private

  # def additional_new_move(movement)
  #   @moves << [@location[0] + movement, @location[1]]
  # end

  def first_move_bonus(board)
    double_rank = @location[0] + (rank_direction * 2)
    file = @location[1]
    [double_rank, file] unless board[double_rank][file]
  end

  def rank_direction
    color == :white ? -1 : 1
  end
end
