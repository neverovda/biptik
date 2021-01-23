module TriangleGenerator
  class << self
    def get(iterations)
      triangl = [[1]]
      iterations.times { |i| triangl[i + 1] = generate(triangl[i].clone) }
      triangl.map { |s| s.join(' ') }
    end

    private

    def generate(arr)
      arr.unshift 0
      arr.each_index { |i| arr[i] += arr[i + 1] if arr[i + 1] }
    end
  end
end
