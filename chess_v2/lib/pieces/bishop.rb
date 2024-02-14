# frozen_string_literal: true

require_relative 'piece'

# logic for each chess piece
class Bishop < Piece
  attr_reader :symbol, :test, :color

  def initialize(args)
    super(args)
    @location = args[:location]
    @symbol = " \u265D "
  end

  def current_moves(board)
    find_valid_moves(board).compact.flatten(1)
  end

  def current_captures(board)
    find_valid_captures(board).compact
  end

  private

  def move_set
    [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end
end
