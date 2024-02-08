# Substrings Counter in Ruby

A Ruby script that provides a versatile `substrings` method for finding and counting occurrences of substrings in a given text based on a provided dictionary. This script is case-insensitive and can handle multiple words.

## Usage

1. Define a dictionary array with the substrings you want to search for.

2. Call the `substrings` method with the target text and the dictionary array.

3. Receive a hash with substring occurrences.

## Example

```ruby

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

result = substrings("Howdy partner, sit down! How's it going?", dictionary)
puts result

# Output: { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
```

## Features

- Case-insensitive: The method considers both lowercase and uppercase versions of substrings for matching.

- Multiple words support: Handles multiple words in the input text, providing a comprehensive count of each substring.