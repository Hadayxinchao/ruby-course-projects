def merge(left_array, right_array)
  return right_array if left_array.empty?
  return left_array if right_array.empty?

  smallest_number = if left_array.first <= right_array.first
    left_array.shift
  else
    right_array.shift
  end

  recursive = merge(left_array, right_array)

  [smallest_number].concat(recursive)
end

def merge_sort(array)
  if array.length <= 1
    return array
  end

  left = array[0..(array.length / 2 - 1)]
  right = array[(array.length / 2)..-1]
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)

  merge(sorted_left, sorted_right)
end

# Example usage
input1 = [3, 2, 1, 13, 8, 5, 0, 1]
output1 = merge_sort(input1)
puts output1.inspect

input2 = [105, 79, 100, 110]
output2 = merge_sort(input2)
puts output2.inspect