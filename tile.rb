class Tile
  attr_accessor(:x, :y, :val)

  def initialize(x, y, val)
    @x = x
    @y = y
    @z = 1
    @val = val
    @color = (Gosu.random(0,99999999) + 0x77000000).round
  end

  def draw
    draw_rect(@x, @y, @x+200, @y+200, @color)
  end

end
