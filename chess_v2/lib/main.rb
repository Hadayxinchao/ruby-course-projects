# frozen_string_literal: true

require_relative 'chess_board.rb'
require_relative 'notation_translator.rb'
require_relative 'pieces/piece.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/pawn.rb'

board = ChessBoard.new
board.initial_placement
board.to_s
mover = board.select_piece('a2')
puts "mover is #{mover}"
board.update_data(2, 0, mover)
board.update_data(1, 0, nil)
board.to_s