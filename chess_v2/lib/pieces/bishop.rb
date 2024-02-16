# frozen_string_literal: true

require_relative 'piece'

# logic for each chess piece
class Bishop < Piece
  attr_reader :symbol, :test, :color

  def initialize(_board, args)
    @color = args[:color]
    @location = args[:location]
    @symbol = " \u265D "
  end

  private

  def move_set
    [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end
end
