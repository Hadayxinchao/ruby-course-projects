# frozen_string_literal: true

require_relative 'basic_movement'

# contains logic for en passant moves
class EnPassantMovement < BasicMovement
  def initialize(board = nil, row = nil, column = nil)
    @board = board
    @row = row
    @column = column
  end

  # updates instance variables and runs script to update en passant moves
  def update_pieces(board, coords)
    @board = board
    @row = coords[:row]
    @column = coords[:column]
    update_en_passant_moves
  end

  # script to update en passant moves
  def update_en_passant_moves
    remove_capture_piece_observer
    update_active_pawn_coordinates
    remove_original_piece
    remove_en_passant_capture
    update_active_piece_location
  end

  # updates the board with pawn's piece in the new location
  def update_active_pawn_coordinates
    @board.data[new_rank][column] = @board.active_piece
  end

  # removes the captured pawn from the board
  def remove_en_passant_capture
    @board.data[row][column] = nil
  end

  # updates the board with active piece's location in front of captured pawn
  def update_active_piece_location
    @board.active_piece.update_location(new_rank, column)
  end

  # determines the new rank of the pawn based on its rank direction
  def new_rank
    row + @board.active_piece.rank_direction
  end
end
