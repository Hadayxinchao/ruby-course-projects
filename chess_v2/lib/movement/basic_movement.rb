# frozen_string_literal: true

# contains logic for basic moves for all pieces
class BasicMovement
  attr_reader :row, :column, :board

  def initialize(board = nil, row = nil, column = nil)
    @board = board
    @row = row
    @column = column
  end

  # updates instance variables and runs script to update basic moves
  def update_pieces(board, coords)
    @board = board
    @row = coords[:row]
    @column = coords[:column]
    update_basic_moves
  end

  # script to update basic moves
  def update_basic_moves
    remove_capture_piece_observer if @board.data[row][column]
    update_new_coordinates
    remove_original_piece
    update_active_piece_location
  end

  # removes the observer from a captured piece
  def remove_capture_piece_observer
    @board.delete_observer(@board.data[row][column])
  end

  # updates the board with active piece's in the new location
  def update_new_coordinates
    @board.data[row][column] = @board.active_piece
  end

  # removes the original piece that was copied to a new location
  def remove_original_piece
    location = @board.active_piece.location
    @board.data[location[0]][location[1]] = nil
  end

  # sends message to active piece to updates its location
  def update_active_piece_location
    @board.active_piece.update_location(row, column)
  end
end
