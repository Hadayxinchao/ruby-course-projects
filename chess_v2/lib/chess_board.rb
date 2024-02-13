# frozen_string_literal: true

# contains logic for chess board
class ChessBoard
  attr_reader :data, :active_piece

  def initialize(data = Array.new(8) { Array.new(8) }, active_piece = nil)
    @data = data
    @active_piece = active_piece
  end

  # Tested
  def display_valid_moves(coordinates)
    @active_piece = data[coordinates[:row]][coordinates[:column]]
    # Should this be moved out of this method???
    @active_piece.update_moves
    @active_piece.update_captures
    # Check the piece.moves to also be nil to display dot.
    to_s
  end

  def valid_piece?(coordinates)
    # use piece instead of coordinates?
    valid_empty_moves?(coordinates) || valid_capture_moves?(coordinates)
  end

  # Tested
  def valid_empty_moves?(coordinates)
    piece = data[coordinates[:row]][coordinates[:column]]
    piece.update_moves
    possible_moves = piece.moves
    possible_moves.any? { |moves| data[moves[0]][moves[1]].nil? }
  end

  def valid_capture_moves?(coordinates)
    piece = data[coordinates[:row]][coordinates[:column]]
    piece.update_captures
    possible_captures = piece.captures
    possible_captures.any? { |moves| data[moves[0]][moves[1]] }
  end

  # Only Puts Method -> No tests needed
  # 36 = Cyan Text (94 light blue looks good too)
  def to_s
    system 'clear'
    puts
    puts "\e[36m    a  b  c  d  e  f  g  h \e[0m"
    print_board
    puts "\e[36m    a  b  c  d  e  f  g  h \e[0m"
    puts
  end

  # Script Method -> No tests needed (test inside methods)
  def update(coords)
    update_final_coordinates(coords)
    update_original_coordinates
    update_active_piece(coords)
  end

  # Tested
  def update_final_coordinates(coords)
    @data[coords[:row]][coords[:column]] = @active_piece
  end

  # Tested
  def update_original_coordinates
    @data[@active_piece.location[0]][@active_piece.location[1]] = nil
  end

  # Tested
  def update_active_piece(coords)
    @active_piece.update_location(coords[:row], coords[:column])
    @active_piece = nil
  end

  # Completed Tests
  def initial_placement
    initial_row(:black, 0)
    initial_pawn_row(:black, 1)
    initial_pawn_row(:white, 6)
    initial_row(:white, 7)
  end

  private

  def initial_pawn_row(color, number)
    8.times do |index|
      @data[number][index] = Pawn.new({ color:, location: [number, index] })
    end
  end

  def initial_row(color, number)
    @data[number] = [
      Rook.new({ color:, location: [number, 0] }),
      Knight.new({ color:, location: [number, 1] }),
      Bishop.new({ color:, location: [number, 2] }),
      Queen.new({ color:, location: [number, 3] }),
      King.new({ color:, location: [number, 4] }),
      Bishop.new({ color:, location: [number, 5] }),
      Knight.new({ color:, location: [number, 6] }),
      Rook.new({ color:, location: [number, 7] })
    ]
  end

  # 36 = Cyan Text (94 light blue looks good too)
  def print_board
    @data.each_with_index do |row, index|
      print "\e[36m #{8 - index} \e[0m"
      print_row(row, index)
      print "\e[36m #{8 - index} \e[0m"
      puts
    end
  end

  def print_row(row, row_index)
    row.each_with_index do |square, index|
      background_color = select_background(row_index, index)
      print_square(row_index, index, square, background_color)
    end
  end

  # 46 = Cyan (active piece to move) (44 blue looks good too)
  # 101 = Light Red (possible capture background)
  # 47 = Light Gray (even)
  # 100 = Dark Gray (odd)
  def select_background(row_index, column_index)
    index_total = row_index + column_index
    if @active_piece && @active_piece.location == [row_index, column_index]
      46
    elsif capture_background?(row_index, column_index)
      101
    elsif index_total.even?
      47
    else
      100
    end
  end

  def capture_background?(row_index, column_index)
    @active_piece&.captures&.any?([row_index, column_index]) && @data[row_index][column_index]
  end

  # 97 = White (chess pieces)
  # 30 = Black (chess pieces)
  # 91 = Light Red (possible moves)
  def print_square(row_index, column_index, square, background)
    if @active_piece&.moves&.any?([row_index, column_index])
      color_square(91, background, " \u25CF ")
    elsif square
      text_color = square.color == :white ? 97 : 30
      color_square(text_color, background, square.symbol)
    else
      color_square(30, background, '   ')
    end
  end

  def color_square(font, background, string)
    print "\e[#{font};#{background}m#{string}\e[0m"
  end
end
