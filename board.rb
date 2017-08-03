class Board
  attr_accessor(:tile_arr)

  def initialize()
    @tile_arr = []

    4.times do |r|
      rowArr = []
      4.times do |c|
        tmpTile = Tile.new(c*200,r*200,0)
        rowArr.push(tmpTile)
      end
      @tile_arr.push(rowArr)
    end

  end # END initialize

  def spawn_two_tiles
    2.times do |i|
      randRow = Gosu.random(0,3)
      randCol = Gosu.random(0,3)
      tmpTile = Tile.new(randCol*200,randRow*200,2)
      @tile_arr[randRow][randCol] = tmpTile
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
