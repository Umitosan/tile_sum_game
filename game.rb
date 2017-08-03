require 'rubygems'
require 'gosu'
require 'pry'

require_relative 'board'
require_relative 'tile'

include Gosu


WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800

class MyWindow < Gosu::Window
  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, :fullscreen => false)
    self.caption = "Tile sum game" # the caption method must come after the window creation "super()"
    @myBoard = Board.new
    @myBoard.spawn_two_tiles
    @tiles_moving = false
    @tiles_status_txt = Gosu::Image.from_text( "false", 40 )
    @move_timer = nil
  end

  # the built-in 'draw_quad' method is redefined for simplicity
  def draw_rect(x, y, w, h, color)
    draw_quad x, y, color, x + w, y, color,
              x, y + h, color, x + w, y + h, color
  end

  def trigger_move
    if @tiles_moving == false
      @tiles_moving = true
      @tiles_status_txt = Gosu::Image.from_text( "true", 40 )
      @move_timer = Gosu.milliseconds
    end
  end

  def check_move_timer
    if ((Gosu.milliseconds - @move_timer) > 500)
      @tiles_moving = false
      @tiles_status_txt = Gosu::Image.from_text( "false", 40 )
    end
  end

  def button_down(button)
    if button == Gosu::KbEscape
       self.close!
    elsif button == Gosu::KbSpace
      @myBoard.spawn_two_tiles
    elsif button == Gosu::KB_LEFT
      trigger_move
    elsif button == Gosu::KB_RIGHT
      trigger_move
    elsif button == Gosu::KB_UP
      trigger_move
    elsif button == Gosu::KB_DOWN
      trigger_move
    else
      super
    end
  end # END BUTTON DOWN

  ##############################################################
  def update
    if (@tiles_moving == true)
      check_move_timer
    end
  end # END UPDATE

  def draw
    draw_rect(0,0,WINDOW_HEIGHT,WINDOW_WIDTH,0x77222222)
    @myBoard.draw
    @tiles_status_txt.draw(0,0,2)
  end
  ##############################################################
end # END MyWindow


# ======================================================================#
# ======================================================================#
# ======================================================================#


MyWindow.new.show
