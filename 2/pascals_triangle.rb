module TriangleGenerator
  class << self
    def get_str_by_index(index)
      a = [1]
      index.times { a = generate(a) }
      a.join(' ')
    end

    private

    def generate(arr)
      arr.unshift 0
      arr.each_index { |i| arr[i] += arr[i + 1] if arr[i + 1] }
    end
  end
end
