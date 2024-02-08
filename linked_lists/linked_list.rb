class LinkedList
  attr_accessor :head, :tail, :length
  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end
  
  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end
    @length += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head = new_node
    end
    @length += 1
  end

  def size
    @length
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if @head.nil? || index > @length
    current_node = @head
    count = 0
    while count < index
      current_node = current_node.next
      count += 1
    end
    current_node
  end

  def pop
    return nil if @head.nil?
    if @head == @tail
      @head = @tail = nil
    else
      current_node = @head
      while current_node.next != @tail
        current_node = current_node.next
      end
      current_node.next = nil
      @tail = current_node
    end
  end

  def contain?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value
      current_node = current_node.next
    end
    return false
  end

  def find(value)
    current_node = @head
    count = 0
    until current_node.nil?
      return count if current_node.value == value
      count += 1 
      current_node = current_node.next
    end
    return nil
  end

  def insert_at(value, index)
    return nil if @head.nil? || index < 0 || index > @length
    current_node = @head
    count = 0
    while count < index - 1
      current_node = current_node.next
    end
    new_node = Node.new(value)
    new_node.next = current_node.next
    current_node.next = new_node
    @length += 1
  end

  def remove_at(index)
    return nil if @head.nil? || index < 0 || index > @length
    current_node = @head
    count = 0
    while count < index - 1
      current_node = current_node.next
      count += 1
    end
    current_node.next = current_node.next.next
    @length -= 1
  end
end

class Node
  attr_accessor :value, :next
  def initialize(value)
    @next = nil
    @value = value
  end
end
