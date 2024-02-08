require_relative "cell.rb"

class Knight
  def initialize(size)
    @size = size
  end
  attr_accessor :size
  
  def isInside(x, y)
    return true if ((1..@size).include?(x) && (1..@size).include?(y))
    return false
  end

  def knight_moves(knightPos, targetPos)
    dx = [-2, -1, 1, 2, -2, -1, 1, 2]
    dy = [-1, -2, -2, -1, 1, 2, 2, 1]

    queue = []

    queue << Cell.new(knightPos[0], knightPos[1], 0, [[knightPos[0], knightPos[1]]])
    visited = Array.new(@size + 1) { Array.new(@size + 1) {nil} }
    visited[knightPos[0]][knightPos[1]] = true
    while queue.length > 0
      t = queue[0]
      queue.shift
      if t.x == targetPos[0] && t.y == targetPos[1]
        puts "#{t.dis} steps: #{t.path}"
      end
      8.times do |i|
        x = t.x + dx[i]
        y = t.y + dy[i]
        if isInside(x, y) and !visited[x][y]
          visited[x][y] = true
          newPath = t.path + [[x, y]]
          queue << Cell.new(x, y, t.dis + 1, newPath)
        end
      end
    end
  end
end

knight = Knight.new(30)
knightPos = [0, 0]
targetPos = [30, 30]

knight.knight_moves(knightPos, targetPos)

