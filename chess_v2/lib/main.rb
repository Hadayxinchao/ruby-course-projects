# frozen_string_literal: true

require 'pry'

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

game = Game.new
game.play

# Maybe need to separate the piece testing current moves & current captures,
# so that testing does not need to use king in check portion of method.

# When does "checking" for check happen?
# 1. Each piece needs to remove any moves that could put their King in check.
# 2. At the beginning of a turn, if the King is in check, the move must un-check the King.

# Adding "check" to King
# Check -> When opponent piece can attack King
# Update legal moves -> Move can not put King in check.

# Remove each piece checking current_moves & current_captures at the beginning of each turn.

# Game ->
# Make a method inside #select_move_coordinates that has board check opponent pieces putting King into check.

# Should Game#select_piece_coordinates have an array of pieces with moves/captures?

# Should Board#active_piece_moveable? remove any move that would put King in check?
# Does Board#check?(king)? Do what we need it to do? Should it do both kings in one check?

# Board.initial_placement tests are failing!!!

# current_moves = piece.moves only works in ones that inherit that from piece.
# need to change king, knight, pawn

# BUG: white pawn c4, black pawn in d5 -> triggered en passsant incorrectly!

# Remove unneccessary tests from the different pieces.

# Look into creating 2 array of pieces with moves/captures for #validate_active_piece

# refactor current_moves for Pawn, Knight, others? -> ABC complexity!!
# Pawn #current_moves & #current_captures -> Need refactored
# Knight #current_moves & #current_captures -> Need refactored

# Determine if King is in check at the beginning of the turn. Only pieces can move that can block it.
# Will need to remove captures if a King is in check at the beginning of a turn.