# frozen_string_literal: true

require_relative 'piece'

# logic for rook chess piece
class Rook < Piece
  def initialize(board, args)
    board.add_observer(self)
    @color = args[:color]
    @location = args[:location]
    @symbol = " \u265C "
    @moved = false
    @moves = []
    @captures = []
  end

  private

  # list of possible directions that a king can move
  def move_set
    [[0, 1], [0, -1], [-1, 0], [1, 0]]
  end
end
