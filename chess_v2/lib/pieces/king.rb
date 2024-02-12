require_relative 'piece'

# logic for each chess piece
class King < Piece
  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " \u265A "
  end
end