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
  class CoordinatesError < StandardError
    def message
      'Invalid coordinates! Enter column & row that has a chess piece.'
    end
  end

  # Declares error message when user enters invalid move
  class MoveError < StandardError
    def message
      'Invalid coordinates! Enter a valid column & row to move.'
    end
  end

  # Declares error message when user enters invalid move
  class PieceError < StandardError
    def message
      'Invalid piece! This piece can not move. Please enter a different column & row.'
    end
  end

  def initialize(board = Board.new)
    @board = board
  end

  # Public Script Method -> No tests needed (test inside methods)
  # Need to test any outgoing command messages ??
  def play
    @board.initial_placement
    @board.to_s
    # player_turn
    # Need to switch current player
    12.times { player_turn }
  end

  # Script Method -> Test methods inside
  # Need to test any outgoing command messages ??
  def player_turn
    select_piece_coordinates
    @board.to_s
    move = select_move_coordinates
    @board.update(move)
    @board.to_s
  end

  # Script Method -> No tests needed (test inside methods)
  # Need to test any outgoing command messages ??
  def select_piece_coordinates
    input = user_input('What piece would you like to move?')
    validate_input(input)
    coords = translate_coordinates(input)
    validate_piece_coordinates(coords)
    @board.update_active_piece(coords)
    validate_active_piece
  rescue StandardError => e
    puts e.message
    retry
  end

  # Script Method -> No tests needed (test inside methods)
  # Need to test any outgoing command messages ??
  def select_move_coordinates
    input = user_input('Where would you like to move it?')
    validate_input(input)
    coords = translate_coordinates(input)
    validate_move(coords)
    coords
  rescue StandardError => e
    puts e.message
    retry
  end

  # Tested
  def validate_input(input)
    raise InputError unless input.match?(/^[a-h][1-8]$/)
  end

  # Tested
  def validate_piece_coordinates(coords)
    raise CoordinatesError unless @board.piece?(coords)
  end

  # Tested
  def validate_move(coords)
    raise MoveError unless @board.valid_piece_movement?(coords)
  end

  # Tested
  def translate_coordinates(input)
    translator ||= NotationTranslator.new
    translator.translate_notation(input)
  end

  # Tested
  def validate_active_piece
    raise PieceError unless @board.active_piece_moveable?
  end

  private

  def user_input(phrase)
    puts phrase
    gets.chomp
  end
end
