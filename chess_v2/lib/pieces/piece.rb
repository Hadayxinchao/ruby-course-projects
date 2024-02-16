# frozen_string_literal: true

require_relative '../board'
require_relative '../move_validator'

# logic for each chess piece
class Piece
  attr_reader :location, :color, :symbol, :moves, :captures

  def initialize(board, args)
    board.add_observer(self)
    @color = args[:color]
    @location = args[:location]
    @symbol = nil
    @moves = []
    @captures = []
    @moved = false
  end

  # Tested
  def update_location(row, column)
    @location = [row, column]
    @moved = true
  end

  def current_moves(board)
    possibilities = find_valid_moves(board.data).compact.flatten(1)
    @moves = remove_king_check_moves(board, possibilities)
  end

  # DATA WILL BE UPDATED TO SELF!!!
  # Update other pieces moves & captures to be data instead of board
  def current_captures(board)
    @captures = find_valid_captures(board.data).compact
  end

  # Checks all board move possibilities if a move would put king in check
  def remove_king_check_moves(board, moves)
    return moves unless moves.size.positive?

    check = MoveValidator.new(self, board, moves)
    check.verify_possible_moves
  end

  def update(board)
    current_moves(board)
    current_captures(board)
  end

  private

  def move_set
    raise 'Called abstract method: move_set'
  end

  def find_valid_moves(data)
    move_set.inject([]) do |memo, move|
      memo << create_moves(data, move[0], move[1])
    end
  end

  def create_moves(data, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    result = []
    while valid_location?(rank, file)
      break if data[rank][file]

      result << [rank, file]
      rank += rank_change
      file += file_change
    end
    result
  end

  def find_valid_captures(data)
    move_set.inject([]) do |memo, move|
      memo << create_captures(data, move[0], move[1])
    end
  end

  def create_captures(data, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    while valid_location?(rank, file)
      break if data[rank][file]

      rank += rank_change
      file += file_change
    end
    [rank, file] if opposing_piece?(rank, file, data)
  end

  def valid_location?(rank, file)
    rank.between?(0, 7) && file.between?(0, 7)
  end

  def opposing_piece?(rank, file, data)
    return false unless valid_location?(rank, file)

    piece = data[rank][file]
    piece && piece.color != color
  end
end
