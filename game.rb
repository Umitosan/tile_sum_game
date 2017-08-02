require 'rubygems'
require 'gosu'
require 'pry'

include Gosu


WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800

class MyWindow < Gosu::Window
  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT, :fullscreen => false)
    self.caption = "Tile sum game" # the caption method must come after the window creation "super()"

  end

  # the built-in 'draw_quad' method is redefined for simplicity
  def draw_rect(x, y, w, h, color)
    draw_quad x, y, color, x + w, y, color,
              x, y + h, color, x + w, y + h, color
  end

  def button_down(button)
    if button == Gosu::KbEscape
       self.close!
    else
      super
    end
  end # END BUTTON DOWN

  ##############################################################
  def update
    if Gosu.button_down?(Gosu::KB_LEFT)

    end
    if Gosu.button_down?(Gosu::KB_RIGHT)

    end
    if Gosu.button_down?(Gosu::KB_UP)

    end
    if Gosu.button_down?(Gosu::KB_DOWN)

    end
  end # END UPDATE

  def draw

  end
  ##############################################################
end # END MyWindow


# ======================================================================#
# ======================================================================#
# ======================================================================#


MyWindow.new.show
