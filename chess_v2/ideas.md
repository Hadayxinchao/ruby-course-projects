ChessBoard.print_square
It should not show a red dot when it the square already has a piece on the board. (currently over-writes piece).

lib/chess_board.rb -- 11 warnings:
  [147]:ControlParameter: ChessBoard#print_square is controlled by argument 'column_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [147]:ControlParameter: ChessBoard#print_square is controlled by argument 'row_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [126, 139, 146]:DataClump: ChessBoard takes parameters ['column_index', 'row_index'] to 3 methods [https://github.com/troessner/reek/blob/v6.3.0/docs/Data-Clump.md]
  [108, 110]:DuplicateMethodCall: ChessBoard#print_board calls '8 - index' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [108, 110]:DuplicateMethodCall: ChessBoard#print_board calls 'print "\e[36m #{8 - index} \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [47, 49]:DuplicateMethodCall: ChessBoard#to_s calls 'puts "\e[36m    a  b  c  d  e  f  g  h \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [67, 67]:DuplicateMethodCall: ChessBoard#update_original_coordinates calls '@active_piece.location' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [146]:LongParameterList: ChessBoard#print_square has 4 parameters [https://github.com/troessner/reek/blob/v6.3.0/docs/Long-Parameter-List.md]
  [32]:NilCheck: ChessBoard#valid_empty_moves? performs a nil-check [https://github.com/troessner/reek/blob/v6.3.0/docs/Nil-Check.md]
  [4]:TooManyMethods: ChessBoard has at least 19 methods [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Methods.md]
  [44]:TooManyStatements: ChessBoard#to_s has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]

lib/game.rb -- 5 warnings:
  [71]:TooManyStatements: Game#select_move_coordinates has approx 9 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [55]:TooManyStatements: Game#select_piece_coordinates has approx 10 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [78]:UncommunicativeVariableName: Game#select_move_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [65]:UncommunicativeVariableName: Game#select_piece_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [101]:UtilityFunction: Game#translate_coordinates doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
  
lib/pieces/pawn.rb -- 4 warnings:
  [33, 34]:DuplicateMethodCall: Pawn#update_captures calls 'row + movement' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [22, 32, 40]:RepeatedConditional: Pawn tests 'color == :white' at least 3 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Repeated-Conditional.md]
  [6]:TooManyInstanceVariables: Pawn has at least 5 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
  [28]:TooManyStatements: Pawn#update_captures has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]