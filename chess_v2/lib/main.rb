# frozen_string_literal: true

require_relative 'chess_board.rb'
require_relative 'pieces/piece.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/rook.rb'

board = ChessBoard.new
board.initial_placement
board.to_s