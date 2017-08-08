class Board
  attr_accessor(:tile_arr)

  def initialize()
    @tile_arr = []
    @filled_tiles = 0

    4.times do |r|
      rowArr = []
      4.times do |c|
        emptyTile = Tile.new(c*200,r*200,0,0x99000000)
        rowArr.push(emptyTile)
      end
      @tile_arr.push(rowArr)
    end

  end # END initialize

  def spawn_tile
    randRow = Gosu.random(0,4).floor
    randCol = Gosu.random(0,4).floor
    if ((@tile_arr[randRow][randCol].val == 0) && (@filled_tiles < 16))
      randColor = (Gosu.random(0,99999999) + 0x77000000).round
      tmpTile = Tile.new(randCol*200,randRow*200,2,randColor)
      @tile_arr[randRow][randCol] = tmpTile
      @filled_tiles += 1
    elsif (@filled_tiles == 16)
      1
    else
      spawn_tile # try again
    end
  end

  def tiles_left

  end
  def tiles_right

  end
  def tiles_up

  end
  def tiles_down

  end

  def reset
    @tile_arr = []
    @filled_tiles = 0

    4.times do |r|
      rowArr = []
      4.times do |c|
        emptyTile = Tile.new(c*200,r*200,0,0x99000000)
        rowArr.push(emptyTile)
      end
      @tile_arr.push(rowArr)
    end
  end

  def draw
    @tile_arr.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        tile.draw
      end
    end
  end #end DRAW

end
