# frozen_string_literal: true

require_relative 'chess_board.rb'
require_relative 'pieces/piece.rb'
require_relative 'pieces/pawn.rb'

board = ChessBoard.new

white_pawn = Pawn.new(:white)
black_pawn = Pawn.new(:black)
board.update_value(1, 0, black_pawn)
board.update_value(6, 0, white_pawn)
board.to_s