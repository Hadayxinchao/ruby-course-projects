lib/board.rb -- 16 warnings:
  [11]:Attribute: Board#active_piece is a writable attribute [https://github.com/troessner/reek/blob/v6.3.0/docs/Attribute.md]
  [11]:Attribute: Board#data is a writable attribute [https://github.com/troessner/reek/blob/v6.3.0/docs/Attribute.md]
  [11]:Attribute: Board#previous_piece is a writable attribute [https://github.com/troessner/reek/blob/v6.3.0/docs/Attribute.md]
  [65]:ControlParameter: Board#king_in_check? is controlled by argument 'color' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [218]:ControlParameter: Board#no_legal_moves_captures? is controlled by argument 'color' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [218, 220, 220]:FeatureEnvy: Board#no_legal_moves_captures? refers to 'piece' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [191, 191]:FeatureEnvy: Board#promotion_rank? refers to 'color' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [191, 191]:FeatureEnvy: Board#promotion_rank? refers to 'rank' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [78, 80, 80]:FeatureEnvy: Board#random_black_piece refers to 'piece' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [42, 42]:FeatureEnvy: Board#valid_piece? refers to 'coords' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [7]:TooManyInstanceVariables: Board has at least 7 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
  [7]:TooManyMethods: Board has at least 28 methods [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Methods.md]
  [205]:TooManyStatements: Board#castling_moves? has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [107]:TooManyStatements: Board#initial_placement has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [64]:TooManyStatements: Board#king_in_check? has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [75]:TooManyStatements: Board#random_black_piece has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/displayable.rb -- 7 warnings:
  [68]:ControlParameter: Displayable#print_square is controlled by argument 'column_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [68]:ControlParameter: Displayable#print_square is controlled by argument 'row_index' [https://github.com/troessner/reek/blob/v6.3.0/docs/Control-Parameter.md]
  [22, 24]:DuplicateMethodCall: Displayable#print_board calls '8 - index' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [22, 24]:DuplicateMethodCall: Displayable#print_board calls 'print "\e[36m #{8 - index} \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [12, 14]:DuplicateMethodCall: Displayable#print_chess_board calls 'puts "\e[36m    a  b  c  d  e  f  g  h \e[0m"' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [64]:LongParameterList: Displayable#print_square has 4 parameters [https://github.com/troessner/reek/blob/v6.3.0/docs/Long-Parameter-List.md]
  [9]:TooManyStatements: Displayable#print_chess_board has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/game.rb -- 10 warnings:
  [76, 80]:DuplicateMethodCall: Game#computer_player_turn calls 'sleep(1.5)' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [6]:TooManyMethods: Game has at least 19 methods [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Methods.md]
  [75]:TooManyStatements: Game#computer_player_turn has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [43]:TooManyStatements: Game#play has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [98]:TooManyStatements: Game#select_move_coordinates has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [86]:TooManyStatements: Game#select_piece_coordinates has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [118]:TooManyStatements: Game#user_select_move has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [103]:UncommunicativeVariableName: Game#select_move_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [92]:UncommunicativeVariableName: Game#select_piece_coordinates has the variable name 'e' [https://github.com/troessner/reek/blob/v6.3.0/docs/Uncommunicative-Variable-Name.md]
  [172]:UtilityFunction: Game#translate_coordinates doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
lib/move_validator.rb -- 1 warning:
  [50, 52]:FeatureEnvy: MoveValidator#safe_king? refers to 'piece' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
lib/movement/castling_movement.rb -- 1 warning:
  [24]:TooManyStatements: CastlingMovement#update_castling_moves has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/movement/pawn_promotion_movement.rb -- 1 warning:
  [24]:TooManyStatements: PawnPromotionMovement#update_pawn_promotion_moves has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/pieces/bishop.rb -- 1 warning:
  [6]:TooManyInstanceVariables: Bishop has at least 5 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
lib/pieces/king.rb -- 8 warnings:
  [102, 103]:DuplicateMethodCall: King#empty_files? calls 'board.data' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [102, 103]:DuplicateMethodCall: King#empty_files? calls 'board.data[location[0]]' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [102, 103]:DuplicateMethodCall: King#empty_files? calls 'board.data[location[0]][file]' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [102, 103]:DuplicateMethodCall: King#empty_files? calls 'location[0]' 2 times [https://github.com/troessner/reek/blob/v6.3.0/docs/Duplicate-Method-Call.md]
  [93, 93, 95]:FeatureEnvy: King#safe_passage? refers to 'piece' more than self (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Feature-Envy.md]
  [103]:NilCheck: King#empty_files? performs a nil-check [https://github.com/troessner/reek/blob/v6.3.0/docs/Nil-Check.md]
  [86]:NilCheck: King#king_pass_through_safe? performs a nil-check [https://github.com/troessner/reek/blob/v6.3.0/docs/Nil-Check.md]
  [6]:TooManyInstanceVariables: King has at least 6 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
lib/pieces/knight.rb -- 3 warnings:
  [6]:TooManyInstanceVariables: Knight has at least 5 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
  [30]:TooManyStatements: Knight#find_possible_captures has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [17]:TooManyStatements: Knight#find_possible_moves has approx 7 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
lib/pieces/pawn.rb -- 1 warning:
  [6]:TooManyInstanceVariables: Pawn has at least 7 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
lib/pieces/piece.rb -- 4 warnings:
  [7]:TooManyInstanceVariables: Piece has at least 6 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
  [92]:TooManyStatements: Piece#create_captures has approx 6 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [77]:TooManyStatements: Piece#create_moves has approx 8 statements [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Statements.md]
  [105]:UtilityFunction: Piece#valid_location? doesn't depend on instance state (maybe move it to another class?) [https://github.com/troessner/reek/blob/v6.3.0/docs/Utility-Function.md]
lib/pieces/queen.rb -- 1 warning:
  [6]:TooManyInstanceVariables: Queen has at least 5 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
lib/pieces/rook.rb -- 1 warning:
  [6]:TooManyInstanceVariables: Rook has at least 6 instance variables [https://github.com/troessner/reek/blob/v6.3.0/docs/Too-Many-Instance-Variables.md]
55 total warnings