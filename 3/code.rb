class Code
  class InappropriateCharactersError < StandardError
    def initialize(msg = 'Inappropriate characters')
      super
    end
  end

  class ShortCodeError < StandardError
    def initialize(msg = 'Short code')
      super
    end
  end

  def initialize(code_str)
    @code_str = prepare(code_str)
  end

  def correct?
    (reverse_nums.map.with_index(1) { |num, i| change(num, i.odd?) }.sum % 10).zero?
  end

  private

  def reverse_nums
    @code_str.each_char.map(&:to_i).reverse
  end

  def change(num, odd)
    return num if odd
    return num * 2 if num < 5

    num * 2 - 9
  end

  def prepare(str)
    raise InappropriateCharactersError unless str.delete('0123456789 ').empty?

    result = str.delete(' ')
    raise ShortCodeError if result.size <= 1

    result
  end
end
