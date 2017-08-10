class Tile
  attr_accessor(:z, :val, :color, :val_img)

  def initialize(val, color)
    @z = 1
    @val = val
    @val_img = Gosu::Image.from_text( val, 60 )
    @color = color
  end

  def update_val_img(num)
    @val = num
    @val_img = Gosu::Image.from_text( num, 60 )
  end

  def draw(x,y)
    draw_rect(x, y, 200, 200, @color)
    @val_img.draw(x+85,y+70,2)
  end

end
