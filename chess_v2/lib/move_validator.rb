# frozen_string_literal: true

# checks possible_moves to determine if it would put King in check
class MoveValidator
  def initialize(location, board, moves)
    @current_location = location
    @possible_board = board
    @possible_moves = moves
    @current_piece = @possible_board.data[location[0]][location[1]]
  end

  def verify_possible_moves
    @possible_board.data[@current_location[0]][@current_location[1]] = nil
    @possible_moves.select do |move|
      legal_move?(move)
    end
  end

  private

  def legal_move?(move)
    temp_board = @possible_board
    temp_board.data[move[0]][move[1]] = @current_piece
    safe_move?(temp_board, move)
  end

  def safe_move?(board, move)
    if @possible_board.check?(@current_piece.color)
      result = move_out_of_check?(board)
    else
      king = find_king_location(move)
      result = safe_king?(king, board)
    end
    board.data[move[0]][move[1]] = nil
    result
  end

  def move_out_of_check?(board)
    !board.check?(@current_piece.color)
  end

  def safe_king?(kings_location, board)
    pieces = board.data.flatten(1).compact
    pieces.none? do |piece|
      next unless piece.color != @current_piece.color

      captures = piece.find_possible_captures(board)
      captures.include?(kings_location)
    end
  end

  def find_king_location(move)
    if @current_piece.symbol == " \u265A "
      move
    elsif @current_piece.color == :black
      @possible_board.black_king.location
    else
      @possible_board.white_king.location
    end
  end
end
