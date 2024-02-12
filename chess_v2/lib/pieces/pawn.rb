require_relative 'piece'

# logic for each chess piece
class Pawn < Piece
  attr_reader :symbol, :test, :color

  def initialize(color)
    super(color)
    @symbol = " \u265F "
  end
end