class Cell
  def initialize(x, y, dis, path)
    @x = x
    @y = y
    @dis = dis
    @path = path
  end
  attr_accessor :x, :y, :dis, :path
end