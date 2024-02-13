require_relative 'board.rb'
require_relative 'save.rb'

class Player
  def initialize(color)
    @color = color
  end
end

class Game
  def initialize
    @board = Board.new
  end

  def play
    input = ""
    start = []
    final = []
    valid_move = []
    puts "Welcome to Chess Game"
    puts "Wanna load a saved game?"
    puts "1- Yes"
    puts "2- No"
    puts "3- Delete a saved game"
    input = gets.chomp
    if input == '1'
      save = Save.new(@board)
      save.display_saved_game_names
      save.load_game
    elsif input == '3'
      save = Save.new(@board)
      save.display_saved_game_names
      save.delete_saved_game
      return 1
    else
      puts "We will play a new game"
    end

    @board.display_board
    loop do
      puts "Player 1 - Color white"
      loop do
        loop do
          puts "Enter the coodinates of the piece you want to move e.g 'A1' or 'exit' to quit or 'save' to save the game"
          input = gets.chomp
          if input == "save"
            save = Save.new(@board)
            save.save_game
            return 1
          elsif input == "exit"
            return 1
          end
          start = Board.convert_to_index(input)
          valid_move = @board.valid_move(start)
          break if Board.convert_to_index(input) != nil && @board.white_listed.include?(@board.grid[start[0]][start[1]]) && valid_move != []
          puts "Invalid place"
        end
        loop do
          puts "Enter the coordinates of the position you want to move to e.g 'E8' or 'exit' to quit"
          input = gets.chomp
          if input == "exit"
            return 1
          end
          final = Board.convert_to_index(input)
          valid_move = @board.valid_move(start)
          if valid_move.include?(final)
            @board.move(start,final)
          end
          break if Board.convert_to_index(input) != nil && valid_move.include?(final)
          puts "invalid move"    
        end
        break if @board.check?("white") == false
        puts "white king still in check !"
        @board.reset_last_move(start,final)
      end

      @board.display_board

      if @board.checkmate?("black")
        puts "checkmate !!!"
        puts "white win"
        break 
      elsif @board.check?("black") 
        puts "black king is in check ! choose right piece"
      end

      puts "Player 2 your turn color black"
      loop do
        loop do
          puts "Enter the coordinates of the piece you want to move e.g 'A1' or 'exit' to quit or 'save' to save the game and leave"
          input = gets.chomp
          if input == "save"
            save = Save.new(@board)
            save.save_game
            return 1
          end
          start = Board.convert_to_index(input)
          valid_move = @board.valid_move(start)
          break if  Board.convert_to_index(input) != nil && @board.black_listed.include?(@board.grid[start[0]][start[1]]) && valid_move != []
          puts "invalid place"
        end
        loop do 
          puts   "Enter the coordinates of the position you want to move to e.g 'E8' or 'exit' to quit"
          input = gets.chomp
          final = Board.convert_to_index(input)
          valid_move = @board.valid_move(start)
          if valid_move.include?(final)
            @board.move(start,final)
          end
          break if  Board.convert_to_index(input) != nil && valid_move.include?(final)
          puts "invalid move"
        end
        break if  @board.check?("black") == false
        puts "black king still in check ! choose right piece"
        @board.reset_last_move(start,final)
      end
      @board.display_board
      if  @board.checkmate?("white")
        puts "checkmate"
        puts "black win"
        break
      elsif @board.check?("white")
        puts "white king is in check"   
      end
    end
  end
end

game = Game.new
game.play  