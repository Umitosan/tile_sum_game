class Tile
  attr_accessor(:x, :y, :val, :color)

  def initialize(x, y, val, color)
    @x = x
    @y = y
    @z = 1
    @val = val
    @color = color
  end

  def draw
    draw_rect(@x, @y, 200, 200, @color)
  end

end
