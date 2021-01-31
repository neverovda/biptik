class DominoBox
  class Domino
    attr_reader :left, :right

    def initialize(left, right)
      @left = left
      @right = right
    end

    def rotate!
      @left, @right = @right, @left
      self
    end

    def to_a
      [left, right]
    end
  end
end
