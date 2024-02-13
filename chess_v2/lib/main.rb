# frozen_string_literal: true

require_relative 'chess_board'
require_relative 'game'
require_relative 'notation_translator'
require_relative 'pieces/piece'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'

game = Game.new
game.play
