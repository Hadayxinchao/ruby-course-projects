
# LinkedList Implementation in Ruby

This is a simple implementation of a linked list in Ruby, consisting of two classes:

1. `Node`: Represents a node in the linked list, with a value and a reference to the next node.
2. `LinkedList`: Represents the entire linked list and includes methods to manipulate the list.

## Usage

1. **Creating a Linked List:**

   ```ruby
   linked_list = LinkedList.new
   linked_list.append(1)
   linked_list.append(2)
   linked_list.prepend(0)
   ```

2. **Accessing Elements:**

   ```ruby
   puts "Linked List: #{linked_list.to_s}"
   puts "Size: #{linked_list.size}"
   puts "Head: #{linked_list.head.value}"
   puts "Tail: #{linked_list.tail.value}"
   ```

3. **Manipulating the Linked List:**

   ```ruby
   linked_list.pop
   puts "After pop:"
   puts "Linked List: #{linked_list.to_s}"
   ```

4. **Searching and Modifying:**

   ```ruby
   puts "Contains 2? #{linked_list.contains?(2)}"
   puts "Find index of 1.5: #{linked_list.find(1.5)}"

   linked_list.remove_at(1)
   puts "After removing element at index 1:"
   puts "Linked List: #{linked_list.to_s}"
   ```

5. **Extra Credit:**

   ```ruby
   linked_list.insert_at(1.5, 2)
   linked_list.remove_at(1)
   ```
## Methods

1. **LinkedList Class Methods:**

- `#append(value)`: Adds a new node containing the given value to the end of the list.
- `#prepend(value)`: Adds a new node containing the given value to the start of the list.
- `#size`: Returns the total number of nodes in the list.
- `#head`: Returns the first node in the list.
- `#tail`: Returns the last node in the list.
- `#at(index)`: Returns the node at the given index.
- `#pop`: Removes the last element from the list.
- `#contains?(value)`: Returns true if the passed-in value is in the list, otherwise false.
- `#find(value)`: Returns the index of the node containing the given value, or nil if not found.
- `#to_s`: Represents the LinkedList object as a string.

2. **Extra Credit Methods:**

- `#insert_at(value, index)`: Inserts a new node with the provided value at the given index.
- `#remove_at(index)`: Removes the node at the given index.