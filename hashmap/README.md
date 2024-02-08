# Ruby HashMap and HashSet Implementation

## Introduction

This project includes a simple implementation of a HashMap and HashSet in Ruby. The HashMap allows you to store key-value pairs, while the HashSet only stores keys without values.

## HashMap Class

The `HashMap` class includes the following methods:

- `initialize(initial_size = 16, load_factor = 0.75)`: Creates a new HashMap with an optional initial size and load factor.
- `set(key, value)`: Sets the value for a given key. If the key already exists, the old value is overwritten.
- `get(key)`: Returns the value associated with the given key, or nil if the key is not found.
- `key?(key)`: Returns true if the key is present in the HashMap, otherwise false.
- `remove(key)`: Removes the entry with the specified key and returns the deleted entry's value. Returns nil if the key is not found.
- `length`: Returns the number of stored keys in the HashMap.
- `clear`: Removes all entries in the HashMap.
- `keys`: Returns an array containing all the keys.
- `values`: Returns an array containing all the values.
- `entries`: Returns an array that contains each key-value pair.

## HashSet Class

The `HashSet` class is similar to the `HashMap` class but only contains keys. It includes the following methods:

- `initialize(initial_size = 16, load_factor = 0.75)`: Creates a new HashSet with an optional initial size and load factor.
- `add(key)`: Adds a key to the HashSet. If the key already exists, it is not added.
- `include?(key)`: Returns true if the key is present in the HashSet, otherwise false.
- `remove(key)`: Removes the specified key from the HashSet and returns the removed key. Returns nil if the key is not found.
- `length`: Returns the number of stored keys in the HashSet.
- `clear`: Removes all entries in the HashSet.
- `keys`: Returns an array containing all the keys.

## Usage

```ruby
# Example usage of HashMap
my_hash_map = HashMap.new
my_hash_map.set("key1", "value1")
puts my_hash_map.get("key1")  # Output: value1

# Example usage of HashSet
my_hash_set = HashSet.new
my_hash_set.add("key1")
puts my_hash_set.include?("key1")  # Output: true
```