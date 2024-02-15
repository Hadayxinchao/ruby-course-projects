lib/board.rb -- 2 warnings:
  [38, 38]:FeatureEnvy: Board#piece? refers to 'coords' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [62, 62]:FeatureEnvy: Board#update_active_piece_location refers to 'coords' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
lib/displayable.rb -- 7 warnings:
  [61]:ControlParameter: Displayable#print_square is controlled by argument 'column_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [61]:ControlParameter: Displayable#print_square is controlled by argument 'row_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [17, 19]:DuplicateMethodCall: Displayable#print_board calls '8 - index' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [17, 19]:DuplicateMethodCall: Displayable#print_board calls 'print "\e[36m #{8 - index} \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [9, 11]:DuplicateMethodCall: Displayable#print_chess_game calls 'puts "\e[36m    a  b  c  d  e  f  g  h \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [57]:LongParameterList: Displayable#print_square has 4 parameters [https://github.com/troessner/reek/blob/v6.3.0/docs/Long-Parameter-List.md]
  [6]:TooManyStatements: Displayable#print_chess_game has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/game.rb -- 6 warnings:
  [51, 54]:DuplicateMethodCall: Game#player_turn calls '@board.to_s' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [73]:TooManyStatements: Game#select_move_coordinates has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [59]:TooManyStatements: Game#select_piece_coordinates has approx 9 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [79]:UncommunicativeVariableName: Game#select_move_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [66]:UncommunicativeVariableName: Game#select_piece_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [105]:UtilityFunction: Game#translate_coordinates doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
lib/pieces/knight.rb -- 2 warnings:
  [28]:TooManyStatements: Knight#current_captures has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [15]:TooManyStatements: Knight#current_moves has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/pieces/pawn.rb -- 2 warnings:
  [28]:TooManyStatements: Pawn#current_captures has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [17]:TooManyStatements: Pawn#current_moves has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/pieces/piece.rb -- 3 warnings:
  [60]:TooManyStatements: Piece#create_captures has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [46]:TooManyStatements: Piece#create_moves has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [72]:UtilityFunction: Piece#valid_location? doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
22 total warningslib/board.rb -- 2 warnings:
  [38, 38]:FeatureEnvy: Board#piece? refers to 'coords' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [62, 62]:FeatureEnvy: Board#update_active_piece_location refers to 'coords' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
lib/displayable.rb -- 7 warnings:
  [61]:ControlParameter: Displayable#print_square is controlled by argument 'column_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [61]:ControlParameter: Displayable#print_square is controlled by argument 'row_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [17, 19]:DuplicateMethodCall: Displayable#print_board calls '8 - index' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [17, 19]:DuplicateMethodCall: Displayable#print_board calls 'print "\e[36m #{8 - index} \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [9, 11]:DuplicateMethodCall: Displayable#print_chess_game calls 'puts "\e[36m    a  b  c  d  e  f  g  h \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [57]:LongParameterList: Displayable#print_square has 4 parameters [https://github.com/troessner/reek/blob/v6.3.0/docs/Long-Parameter-List.md]
  [6]:TooManyStatements: Displayable#print_chess_game has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/game.rb -- 6 warnings:
  [51, 54]:DuplicateMethodCall: Game#player_turn calls '@board.to_s' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [73]:TooManyStatements: Game#select_move_coordinates has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [59]:TooManyStatements: Game#select_piece_coordinates has approx 9 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [79]:UncommunicativeVariableName: Game#select_move_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [66]:UncommunicativeVariableName: Game#select_piece_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [105]:UtilityFunction: Game#translate_coordinates doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
lib/pieces/knight.rb -- 2 warnings:
  [28]:TooManyStatements: Knight#current_captures has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [15]:TooManyStatements: Knight#current_moves has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/pieces/pawn.rb -- 2 warnings:
  [28]:TooManyStatements: Pawn#current_captures has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [17]:TooManyStatements: Pawn#current_moves has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/pieces/piece.rb -- 3 warnings:
  [60]:TooManyStatements: Piece#create_captures has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [46]:TooManyStatements: Piece#create_moves has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [72]:UtilityFunction: Piece#valid_location? doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
22 total warnings