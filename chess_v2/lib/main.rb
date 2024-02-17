# frozen_string_literal: true

require_relative 'board'
require_relative 'displayable'
require_relative 'game'
require_relative 'notation_translator'
require_relative 'move_validator'
require_relative 'pieces/piece'
require_relative 'pieces/king'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'pieces/bishop'
require_relative 'pieces/knight'
require_relative 'pieces/pawn'
require_relative 'movement/basic_movement'
require_relative 'movement/en_passant_movement'
require_relative 'movement/pawn_promotion_movement'
require_relative 'movement/castling_movement'

game = Game.new
game.play

# SAVE & LOAD GAME:
# Idea: Make a saved game for "new" with pieces in original spots?
# Make the game save & EXIT only at start of turn

# REFACTOR:
# Game class is too big - ok?
# Board class is still too big - ok?
# -> move initial placement into module or serialize it?
# Remove the reek ideas.md file
