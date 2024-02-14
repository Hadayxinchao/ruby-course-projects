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
    results = []
    diagonal_posotions = move_possibilities
    diagonal_posotions.each do |position|
      results << diagonal_moves(board, position[0], position[1])
    end
    results.compact.flatten(1)
  end

  def current_captures(board)
    results = []
    diagonal_posotions = move_possibilities
    diagonal_posotions.each do |position|
      results << diagonal_captures(board, position[0], position[1])
    end
    results.compact
  end

  private
  
  def diagonal_moves(board, rank_change, file_change)
    rank = @location[0] + rank_change
    file = @location[1] + file_change
    results = []
    until invalid_location?(rank, file)
      break if board[rank][file]
      results << [rank, file]
      rank += rank_change
      file += file_change
    end
    results
  end

  def diagonal_captures(board, rank_change, file_change)
    rank = @location[0] 
    file = @location[1]
    loop do
      rank += rank_change
      file += file_change
      break if invalid_location?(rank, file) || board[rank][file]
    end
    [rank, file] if opposing_piece?(rank, file, board)
  end

  def move_possibilities
    [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]
  end

  def invalid_location?(rank, file)
    rank.negative? || file.negative? || rank > 7 || file > 7
  end    

  def opposing_piece?(rank, file, board)
    return if invalid_location?(rank, file)
    
    piece = board[rank][file]
    piece && piece.color != color
  end
end
