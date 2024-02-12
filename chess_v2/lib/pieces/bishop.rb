require_relative 'piece'

# logic for each chess piece
class Bishop < Piece
  attr_reader :symbol, :test, :color

  def initialize(color)
    super(color)
    @symbol = " \u265D "
  end
end