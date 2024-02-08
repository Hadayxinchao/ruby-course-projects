class ConnectFour
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, ' ') }
  end

  def drop_piece(column, piece)
    row = @board.transpose[column].rindex(' ')
    raise 'Column is full' if row.nil?

    @board[row][column] = piece
  end

  def display_board
    @board.each { |row| puts row.join('|') }
  end

  def play_game
    puts "Welcome to Connect Four"
    display_board

    player_turn = true

    until game_over?
      if player_turn
        player_move
      else
        ai_move
      end

      display_board
      player_turn = !player_turn
    end

    puts game_result
  end

  private

  def player_move
    column = nil
    
    loop do
      print "Enter the column number(1-7) to drop your piece: "
      column = gets.chomp.to_i - 1

      break if valid_move?(column)

      puts "Invalid move! Please choose a valid column."
    end

    drop_piece(column, "X")
  end

  def ai_move
    column = nil

    loop do
      column = rand(7)
      break if valid_move?(column)
    end

    puts "AI choose column #{column + 1}"
    drop_piece(column, "O")
  end

  def valid_move?(column)
    column.between?(0, 6) && @board.transpose[column].include?(' ')
  end

  def game_over?
    win?('X') || win?('O') || board_full?
  end

  def win?(piece)
    [@board, @board.transpose].each do |lines|
      lines.each do |line|
        return true if line.join.include?(piece * 4)
      end
    end

    diagonals = ([@board, @board.transpose].map(&:reverse) + [@board, @board.transpose]).map(&:join)
    return true if diagonals.any? { |diagonal| diagonal.include?(piece * 4) }

    false
  end

  def board_full?
    @board.flatten.none?(' ')
  end

  def game_result
    return 'It\'s a draw' if board_full?
    return 'Player wins' if win?('X')
    return 'AI wins' if win?('O')
    'Game in progress'
  end
end

# ConnectFour.new.play_game