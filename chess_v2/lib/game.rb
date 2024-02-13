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
      'Invalid Input! Enter a valid (dot) column & row'
    end
  end

  # Declares error message when user enters invalid move
  class NoAvailableOpenMoves < StandardError
    def message
      'Invalid Input! This piece does not have any available open moves.'
    end
  end

  def initialize(board = Board.new)
    @board = board
  end

  # Public Script Method -> No tests needed (test inside methods)
  # Need to test outgoing command message
  def play
    @board.initial_placement
    @board.to_s
    8.times { player_turn }
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
    coords = translate_coordinates(input)
    validate_coordinates(coords)
    # Need to also check for available captures
    validate_piece_moves(coords)
    # validate_piece(coords)
    coords
  rescue StandardError => e
    puts e.message
    retry
  end

  # Script Method -> No tests needed (test inside methods)
  def select_move_coordinates
    puts 'Where would you like to move it?'
    input = gets.chomp
    validate_input(input)
    coords = translate_coordinates(input)
    validate_move(coords)
    coords
  rescue StandardError => e
    puts e.message
    retry
  end

  # Completed Tests
  def validate_input(input)
    raise InputError unless input.match?(/^[a-h][1-8]$/)
  end

  # Completed Tests
  def validate_coordinates(coords)
    raise EmptySquareError unless @board.data[coords[:row]][coords[:column]]
  end

  # Completed Tests
  def validate_move(coords)
    return if @board.active_piece.moves.any?([coords[:row], coords[:column]])

    raise MoveError
  end

  # Completed Tests
  def translate_coordinates(input)
    translator ||= NotationTranslator.new
    translator.translate_notation(input)
  end

  # Need to test
  def validate_piece_moves(coordinates)
    raise NoAvailableOpenMoves unless @board.valid_piece?(coordinates)
  end
end
