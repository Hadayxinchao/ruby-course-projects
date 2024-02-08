class HashMap
  def initialize(size = 16)
    @buckets = Array.new(size) { [] }
    @capacity = 0
    @load_factor = 0.75
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

  def get(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length
    bucket = @buckets[index]
    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end
    return nil
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
    bucket = @buckets[index]

    pair_to_delete = @buckets.find{ |pair| pair[0] == key }

    if pair_to_delete
      bucket.delete(pair_to_delete)
      @capacity -= 1
      return pair_to_delete[1]
    end
    return nil
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


class HashSet
  def initialize(size = 16)
    @buckets = Array.new(size) { [] }
    @capacity = 0
    @load_factor = 0.75
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
    bucket = @buckets[index]
    @buckets.delete(key)
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