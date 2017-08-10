class Board
  attr_accessor(:tile_arr)

  def initialize
    @tile_arr = []
    @filled_tiles = 0

    4.times do |r|
      rowArr = []
      4.times do |c|
        emptyTile = Tile.new(0,0x99000000)
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
      tmpTile = Tile.new(2,randColor)
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

  def self.same?(board1, board2)
    same = false
    same_tiles_sum = 0
    board1.tile_arr.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        if board1.tile_arr[i][j].val == board2.tile_arr[i][j].val
          same_tiles_sum += 1
        end
      end
    end
    if same_tiles_sum == 16
      same = true
    else
      same = false
    end
    same
  end

  def tiles_left
    @tile_arr.each_with_index do |row, i|
      row.each_with_index do |some_tile, j|
        if (j != 0) && (some_tile.val > 0) # make sure the tile isn't leftmost before moving it && don't modify tiles with 0
          tmp_tile = Tile.new(0, 0x99000000)
          tmp_tile.update_val_img(0)
          if (@tile_arr[i][j-1].val == 0) # tile 0? swap positions
            @tile_arr[i][j-1], @tile_arr[i][j] = @tile_arr[i][j], @tile_arr[i][j-1]  # swap positions in array
          elsif (@tile_arr[i][j-1].val == @tile_arr[i][j].val) # only add tiles if same val
            sum = some_tile.val + @tile_arr[i][j-1].val
            some_tile.update_val_img(sum)
            @tile_arr[i][j-1] = some_tile
            @tile_arr[i][j] = tmp_tile
          else
            1
          end
        end
      end
    end # array main loop
  end # tiles_left

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
        emptyTile = Tile.new(0,0x99000000)
        rowArr.push(emptyTile)
      end
      @tile_arr.push(rowArr)
    end
  end

  def draw
    @tile_arr.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        tile_x = j * 200
        tile_y = i * 200
        tile.draw(tile_x,tile_y)
      end
    end
  end #end DRAW

end
