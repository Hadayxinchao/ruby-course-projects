# Recursion Examples

This folder contains examples of recursive algorithms implemented in Ruby.

## Merge Sort

### Description

The `merge_sort` method recursively sorts an array using the merge sort algorithm. The algorithm divides the array into halves until reaching the base case of an array with one or zero elements. It then merges the sorted subarrays back together.

### Example

    ```ruby
    # Example usage
    input = [3, 2, 1, 13, 8, 5, 0, 1]
    output = merge_sort(input)
    puts output.inspect

    # Expected output:
    [0, 1, 1, 2, 3, 5, 8, 13]
    ```


## Fibonacci Sequence

### Description

The `fibs` method generates the Fibonacci sequence up to a specified number using iteration. The `fibs_rec` method achieves the same result using recursion.

### Example

    ```ruby
    # Example usage
    result = fibs(8)
    puts result.inspect
    
    # Expected output:
    [0, 1, 1, 2, 3, 5, 8, 13]
    ```