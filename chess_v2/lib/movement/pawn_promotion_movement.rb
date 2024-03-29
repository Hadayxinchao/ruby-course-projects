# frozen_string_literal: true

require_relative 'basic_movement'

# contains logic for pawn promotion moves
class PawnPromotionMovement < BasicMovement
  def initialize(board = nil, row = nil, column = nil)
    @board = board
    @row = row
    @column = column
  end

  # updates instance variables and runs script to update pawn promotion moves
  def update_pieces(board, coords)
    @board = board
    @row = coords[:row]
    @column = coords[:column]
    update_pawn_promotion_moves
  end

  # script to update pawn promotion moves
  def update_pawn_promotion_moves
    remove_capture_piece_observer if @board.data[row][column]
    remove_pawn_observer
    remove_original_piece
    new_piece = new_promotion_piece
    update_promotion_coordinates(new_piece)
    update_board_active_piece(new_piece)
  end

  # script to create the promoted piece depending on human or computer player
  def new_promotion_piece
    if @board.mode == :computer && @board.active_piece.color == :black
      create_promotion_piece('1')
    else
      puts pawn_promotion_choices
      choice = select_promotion_piece
      create_promotion_piece(choice)
    end
  end

  # removes the observer from the old pawn piece
  def remove_pawn_observer
    location = @board.active_piece.location
    @board.delete_observer(@board.data[location[0]][location[1]])
  end

  # updates the board with promoted piece in the new location
  def update_promotion_coordinates(piece)
    @board.data[row][column] = piece
  end

  # update the board's active piece to the promoted piece
  def update_board_active_piece(piece)
    @board.active_piece = piece
  end

  # returns a valid human player's choice for promoted piece
  def select_promotion_piece
    choice = gets.chomp
    return choice if choice.match?(/^[1-4]$/)

    puts 'Input error! Only enter 1-digit (1-4).'
    select_promotion_piece
  end

  # creates the promoted piece depending on the players choice
  # rubocop:disable Metrics/MethodLength
  def create_promotion_piece(choice)
    color = @board.active_piece.color
    case choice.to_i
    when 1
      Queen.new(@board, { color:, location: [row, column] })
    when 2
      Bishop.new(@board, { color:, location: [row, column] })
    when 3
      Knight.new(@board, { color:, location: [row, column] })
    else
      Rook.new(@board, { color:, location: [row, column] })
    end
  end
  # rubocop:enable Metrics/MethodLength

  private
  
  # lists the choices for a new piece during pawn promotion
  def pawn_promotion_choices
    <<~HEREDOC
      To promote your pawn, enter one of the following numbers:
        \e[36m[1]\e[0m for a Queen
        \e[36m[2]\e[0m for a Bishop
        \e[36m[3]\e[0m for a Knight
        \e[36m[4]\e[0m for a Rook
    HEREDOC
  end
end
