# frozen_string_literal: true

def bubble_sort(numbers)
  numbes_length = numbers.length
  return numbers if numbes_length <= 1

  loop do
    swapped = false
    (numbes_length - 1).times do |i|
      if numbers[i] > numbers[i + 1]
        numbers[i], numbers[i + 1] = numbers[i + 1], numbers[i]
        swapped = true
      end
    end
    break unless swapped
  end
  numbers
end

puts bubble_sort([4, 3, 78, 2, 0, 2])
