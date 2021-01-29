require_relative 'domino.rb'

class DominoBox
  def initialize(*domino_arrs)
    @dominos = prepare(domino_arrs)
    @cycle_chain = []
  end

  def chain
    return if dominos.empty?

    find_cycles
    return unless dominos.empty?

    cycle_chain.map(&:to_a)
  end

  private

  attr_accessor :dominos, :cycle_chain

  def find_cycles
    @cycle_chain << @dominos.shift
    loop do
      last = next_domino(cycle_chain.last, cycle_chain)
      break unless last

      @cycle_chain << last
    end
    return if cycle_chain.first.left != cycle_chain.last.right

    self.dominos -= cycle_chain

    cycle_chain.each do |d|
      find_all_sub_cycles(d)
    end
  end

  def find_all_sub_cycles(position)
    return if @dominos.empty?

    cycle = []
    last = next_domino(position, cycle)
    loop do
      break unless last

      cycle << last
      last = next_domino(cycle.last, cycle)
    end
    return if cycle.empty? || position.right != cycle.last.right

    self.cycle_chain.insert(cycle_chain.index(position) + 1, *cycle)
    self.dominos -= cycle

    cycle_chain.each do |d|
      find_all_sub_cycles(d)
    end
  end

  def next_domino(position, cycle)
    (dominos - cycle).find { |d| position.right == d.left || position.right == d.rotate.left }
  end

  def prepare(domino_arrs)
    domino_arrs.map { |arr| Domino.new(*arr) }
  end
end
