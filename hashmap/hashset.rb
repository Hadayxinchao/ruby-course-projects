class HashSet
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

  def include?(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    !@buckets[index].nil? && @buckets[index].include?(key)
  end

  def add(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]
    
    #Check if the load factor is exceeded
    if (@capacity / @buckets.length.to_f) > @load_factor
      resize_buckets
    end

    #Update the bucket
    return if bucket.include?(key)

    bucket.push(key)
    @capacity += 1
  end

  def key?(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]
    bucket.include?(key)
  end

  def remove(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    if !@buckets[index].nil?
      removed = @buckets[index].delete(key)
      @capacity -= 1 if removed
      return removed
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
    @buckets.flatten
  end
end

my_hash_set = HashSet.new
my_hash_set.add("key1")
my_hash_set.add("key2")

puts my_hash_set.include?("key1") # Output: true
puts my_hash_set.include?("key3") # Output: false

my_hash_set.remove("key1")
puts my_hash_set.include?("key1") # Output: false