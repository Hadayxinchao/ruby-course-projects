# KnightMoves

KnightMoves is a Ruby class that finds the shortest path for a knight on a chessboard using breadth-first search.

## Methods

`initialize`
The constructor initializes the KnightMoves class.

`valid_move?(square)`
Checks if the given square is within the 8x8 chessboard.

`find_shortest_path(start, goal)`
Finds the shortest path from the starting square to the ending square using breadth-first search. Prints the full path and the number of moves.

## Example

```ruby
knight_moves = KnightMoves.new
knight_moves.find_shortest_path([3, 3], [4, 3])
```