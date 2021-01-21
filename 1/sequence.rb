module SequenceGenerator
  class << self
    def get_str_by_index(iterations)
      s = '1'
      iterations.times { s = generate(s) }
      s
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
