module SequenceGenerator
  class << self
    def get(iterations)
      seq = ['1']
      iterations.times { |i| seq[i + 1] = generate(seq[i]) }
      seq
    end

    private

    def generate(str)
      groups = []
      str.each_char do |char|
        if char == groups.last&.last
          groups.last << char
        else
          groups << [char]
        end
      end
      groups.map { |g| [g.size, g.first] }.join
    end
  end
end
