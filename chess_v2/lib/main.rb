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

# When does "checking" for check happen?
# 1. Each piece needs to remove any moves that could put their King in check.
# 2. At the beginning of a turn, if the King is in check, the move must un-check the King.

# Adding "check" to King
# Check -> When opponent piece can attack King
# Update legal moves -> Move can not put King in check.

# Visualizing valid moves & captures
# If a move would put King in check, it needs to be removed!!!

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

# refactor current_moves for Pawn, Knight, others? -> ABC complexity!!
# Remove unneccessary tests from the different pieces.
