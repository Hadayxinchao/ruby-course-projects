class HashMap
  def initialize(initial_size = 16, load_factor = 0.75)
    @buckets = Array.new(initial_size) { [] }
    @capacity = 0
    @load_factor = load_factor
  end
  attr_accessor :buckets

  def hash(value)
    prime_number = 31
    value.chars.reduce(0) { |acc, char| acc * prime_number + char.ord} % @buckets.length
  end

  def resize_buckets
    old_bucket = @buckets
    @buckets = Array.new(@buckets.length * 2) { [] }
    old_bucket.flatten.each do |bucket|
      set(bucket[0], bucket[1])
    end
  end

  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]
    
    #Check if the load factor is exceeded
    if (@capacity / @buckets.length.to_f) > @load_factor
      resize_buckets
    end

    #Update the bucket
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    bucket.push([key, value])
    @capacity += 1
  end

  def get(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]
    if @buckets[index].nil?
      nil
    else
      @buckets[index].each do |entry|
        return entry[1] if entry[0] == key
      end
      nil
    end
  end

  def key?(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]
    bucket.any? { |pair| pair[0] == key}
  end

  def remove(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    if !@buckets[index].nil?
      @buckets[index].each_with_index do |entry, i|
        if entry[0] == key
          removed_entry = @buckets[index].delete_at(i)
          @capacity -= 1
          return removed_entry[1]
        end
      end
    end

    nil
  end
  
  def length
    return @capacity
  end

  def clear
    initialize
  end

  def keys
    @buckets.map do |bucket|
      bucket.map { |pair| pair[0] }.compact 
    end.flatten
  end

  def values
    @buckets.map do |bucket|
      bucket.map { |pair| pair[1] }.compact
    end.flatten
  end

  def entries
    @buckets.map do |bucket|
      bucket.map { |pair| pair }
    end.flatten
  end
end

my_hash_map = HashMap.new
my_hash_map.set("key1", "value1")
my_hash_map.set("key2", "value2")

puts my_hash_map.get("key1")  # Output: value1
puts my_hash_map.key?("key2") # Output: true

my_hash_map.remove("key1")
puts my_hash_map.get("key1")  # Output: nil

puts my_hash_map.length       # Output: 1

my_hash_map.clear
puts my_hash_map.length       # Output: 0