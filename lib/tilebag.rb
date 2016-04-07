class TileBag
  attr_reader :total_tiles
  def initialize
    @default_tiles = {
      "A" => 9, "B" =>  2, "C" =>  2,
      "D" => 4, "E" => 12, "F" =>  2,
      "G" => 3, "H" =>  2, "I" =>  9,
      "J" => 1, "K" =>  1, "L" =>  4,
      "M" => 2, "N" =>  6, "O" =>  8,
      "P" => 2, "Q" =>  1, "R" =>  6,
      "S" => 4, "T" =>  6, "U" =>  4,
      "V" => 2, "W" =>  2, "X" =>  1,
      "Y" => 2, "Z" =>  1,
    }
    @total_tiles = 98
  end

  def draw_tiles(num)
    your_tiles = []
    until your_tiles.length == num do
      tiles_picked = @default_tiles.keys.sample
      your_tiles << tiles_picked
      value = @default_tiles[tiles_picked]
      new_value = value - 1
      @default_tiles[tiles_picked] = new_value
    end


    #subtract tiles from @default_tiles
    # sample = h.keys.sample        example?
    # h.select { |k,v| k == sample }
    return your_tiles
  end

  def tiles_remaining
    @total_tiles -= self.draw_tiles(num).length
    return @total_tiles
  end

end
