require 'ostruct'

class Chess
  ORDINATE = '_abcdefgh'.freeze

  # Chess.new('d2', 'g6')
  def initialize(place1, place2)
    @queen1 = parse(place1)
    @queen2 = parse(place2)
  end

  def strike?
    return true if @queen1.x == @queen2.x
    return true if @queen1.y == @queen2.y
    return true if (@queen1.x - @queen1.y) == (@queen2.x - @queen2.y)
    return true if (@queen1.x + @queen1.y) == (@queen2.x + @queen2.y)

    false
  end

  private

  def parse(place)
    OpenStruct.new(x: ORDINATE.index(place[0]), y: place[1].to_i)
  end
end
