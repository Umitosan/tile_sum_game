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
    elsif (@filled_tiles >= 16) # game over?
      1
    else
      spawn_tile # try again
    end
    update_filled_tiles_count
  end

  def update_filled_tiles_count
    sum = 0
    @tile_arr.each do |r|
      r.each do |tile|
        if tile.val > 0
          sum += 1
        end
      end
    end
    @filled_tiles = sum
  end

  def tiles_left
    @tile_arr.each_with_index do |r, i|
      r.each_with_index do |some_tile, j|

          if (j != 0) && (some_tile.val > 0) # make sure the tile isn't leftmost before moving it && don't modify tiles with 0
            tmp_tile = Tile.new(some_tile.x, some_tile.y, 0, 0x99000000)
            tmp_tile.update_val(0)
            if (@tile_arr[i][j-1].val == 0) # tile 0? swap positions
              @tile_arr[i][j].x -= 200 # update coordinates
              @tile_arr[i][j-1].x += 200  # update coordinates
              @tile_arr[i][j-1], @tile_arr[i][j] = @tile_arr[i][j], @tile_arr[i][j-1]  # swap in array
            elsif (@tile_arr[i][j-1].val >= 2)
              some_tile.x = @tile_arr[i][j-1].x # update x
              sum = some_tile.val + @tile_arr[i][j-1].val
              some_tile.update_val(sum)
              @tile_arr[i][j-1] = some_tile
              @tile_arr[i][j] = tmp_tile
            else
              1
            end
          end

      end
    end
    # move the tile left if a space to left
    # move tile left and add and destry tile if tile on left is same number
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
