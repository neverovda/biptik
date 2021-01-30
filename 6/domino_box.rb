require_relative 'domino.rb'

class DominoBox
  def initialize(*domino_arrs)
    @dominos = prepare(domino_arrs)
    @cycle_chain = []
  end

  def chain
    return if dominos.empty?

    @cycle_chain << @dominos.shift
    find_all_cycles(@cycle_chain.last) unless @dominos.empty?
    return unless dominos.empty?

    cycle_chain.map(&:to_a)
  end

  private

  attr_accessor :dominos, :cycle_chain

  def find_all_cycles(position)
    sequence = make_sequence(position)
    return unless cycle?(position, sequence)

    @cycle_chain.insert(cycle_chain.index(position) + 1, *sequence)
    @dominos -= sequence

    cycle_chain.each { |d| find_all_cycles(d) unless @dominos.empty? }
  end

  def make_sequence(position)
    sequence = []
    last = next_domino(position, sequence)
    loop do
      break unless last

      sequence << last
      last = next_domino(sequence.last, sequence)
    end
    sequence
  end

  def cycle?(position, cycle)
    first_cycle = (@cycle_chain.size == 1)
    return false if cycle.empty?
    return false if first_cycle && position.left != cycle.last.right
    return false if !first_cycle && position.right != cycle.last.right

    true
  end

  def next_domino(position, cycle)
    (dominos - cycle).find { |d| position.right == d.left || position.right == d.rotate.left }
  end

  def prepare(domino_arrs)
    domino_arrs.map { |arr| Domino.new(*arr) }
  end
end
