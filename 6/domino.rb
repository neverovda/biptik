class DominoBox
  def initialize(*dominos)
    @dominos = dominos
  end

  def chain
    self.result = []
    return result unless @dominos.any?

    result << dominos.shift
    attach_tail
    result unless dominos.any?
  end

  private

  attr_accessor :dominos, :result

  def attach_tail
    loop do
      break unless dominos.any?

      domino = eq_first_side || eq_second_side
      break unless domino

      result << dominos.delete(domino)
    end
  end

  def eq_first_side
    dominos.find { |d| result.last.last == d[0] }
  end

  def eq_second_side
    dominos.find { |d| result.last.last == d[1] }&.reverse!
  end
end
