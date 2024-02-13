# frozen_string_literal: true

# contains logic for chess board
class Game
  # Declares error message when user enters invalid input
  class InputError < StandardError
    def message
      'Invalid Input! Enter column & row, for example: d2'
    end
  end

  # Declares error message when user enters invalid move
  class EmptySquareError < StandardError
    def message
      'Invalid Input! Enter column & row that has a chess piece.'
    end
  end

  # Declares error message when user enters invalid move
  class MoveError < StandardError
    def message
      'Invalid input! Enter a valid (dot) column & row'
    end
  end

  def initialize(board = ChessBoard.new)
    @board = board
  end

  # Public Script Method -> No tests needed (test inside methods)
  # Need to test outgoing command message
  def play
    @board.initial_placement
    @board.to_s
    player_turn
  end

  # Script Method -> Test methods inside
  # Need to test outgoing command message
  def player_turn
    @board.display_valid_moves(select_piece_coordinates)
    @board.update(select_move_coordinates)
    @board.to_s
  end

  # Script Method -> No tests needed (test inside methods)
  def select_piece_coordinates
    puts 'What piece would you like to move?'
    input = gets.chomp
    validate_input(input)
    validate_coordinates(translate_coordinates(input))
  rescue StandardError => e
    puts e.message
    retry
  end

  # Script Method -> No tests needed (test inside methods)
  def select_move_coordinates
    puts 'Where would you like to move it?'
    input = gets.chomp
    validate_input(input)
    validate_move(translate_coordinates(input))
  rescue StandardError => e
    puts e.message
    retry
  end

  # Completed Tests
  def validate_move(coords)
    raise MoveError unless @board.active_piece.moves.any?([coords[:row], coords[:column]])

    coords
  end

  # Completed Tests
  def validate_input(input)
    raise InputError unless input.match?(/^[a-h][1-8]$/)
  end

  # Completed Tests
  def validate_coordinates(coords)
    raise EmptySquareError unless @board.data[coords[:row]][coords[:column]]

    coords
  end

  # Completed Tests
  def translate_coordinates(input)
    translator ||= NotationTranslator.new
    translator.translate_notation(input)
  end
end
