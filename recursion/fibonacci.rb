def fibs(n)
  return [0] if n == 1
  result = [0, 1]
  (n-2).times { |i| result.push(result[-1] + result[-2])}
  return result
end

# Example usage
result = fibs(8)
puts result.inspect

def fibs_rec(n)
  if n <= 2
    return [0, 1][0..n-1]
  else 
    sequence_array = fibs_rec(n-1)
    sequence_array << sequence_array[-1] + sequence_array[-2]
    return sequence_array
  end
end

# Example usage
result_rec = fibs_rec(8)
puts result_rec.inspect