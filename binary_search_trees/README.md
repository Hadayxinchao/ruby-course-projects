# Binary Search Tree in Ruby

This project implements a Binary Search Tree (BST) in Ruby. The BST is a data structure that maintains sorted order and allows efficient insertion, deletion, and search operations.

## Features

- **BST Implementation**: The project provides a complete implementation of a Binary Search Tree.
- **Balancing**: The tree can be checked for balance and rebalanced if necessary.
- **Tree Traversal**: Various tree traversal methods such as level order, in-order, pre-order, and post-order are implemented.
- **Insertion and Deletion**: Nodes can be inserted and deleted from the tree.

## Code Structure

The project consists of two main classes:

1. **Node Class**: Represents a node in the binary search tree.

2. **Tree Class**: Represents the binary search tree and provides methods for tree operations.

## Example

```ruby
# Example Usage

# Create a BST with random numbers
random_numbers = Array.new(15) { rand(1..100) }
bst = Tree.new(random_numbers)

# Check if the tree is balanced
puts "Is the tree balanced? #{bst.balanced?}"

# Unbalance the tree by adding values > 100
unbalanced_values = [110, 120, 130, 140, 150]
unbalanced_values.each { |value| bst.insert(value) }

# Check balance again
puts "Is the tree balanced after adding values > 100? #{bst.balanced?}"

# Rebalance the tree
bst.rebalance

# Check balance after rebalancing
puts "Is the tree balanced after rebalancing? #{bst.balanced?}"
```