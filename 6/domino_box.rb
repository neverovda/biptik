require_relative 'domino.rb'

class DominoBox
  def initialize(*domino_arrs)
    @dominos = prepare(domino_arrs)
    @circles = []
  end

  def can_solve?
    @can_solve ||= solvability?
  end

  def chain
    return unless can_solve?

    find_circles
    chain_circles.map { |d| [d.left, d.right] }
  end

  private

  attr_accessor :dominos, :circles, :result

  def find_circles
    return if dominos.empty?

    circles << [dominos.shift]
    loop do
      break unless dominos.any?

      domino = next_domino
      break unless domino

      circles.last << dominos.delete(domino)
    end
    find_circles
  end

  def chain_circles
    return circles.first if circles.one?

    circle = circles.pop
    first_circle = circles.first
    insert_position = first_circle.index { |domino| circle.first.left == domino.right }

    first_circle.insert(insert_position + 1, circle).flatten! if insert_position

    unless insert_position
      rotate(circle)
      circles.insert(-2, circle)
    end
    chain_circles
  end

  def rotate(circle)
    deleted = circle.shift
    circle.push(deleted)
  end

  def solvability?
    return false if dominos.empty?

    doubles = dominos.select(&:double?)
    various_dominoes = dominos - doubles
    degrees = various_dominoes.map { |d| [d.left, d.right] }.flatten.tally
    return false if doubles.map(&:left).any? { |d| !degrees.key?(d) || degrees[d] < 2 }

    degrees.values.all?(&:even?)
  end

  def next_domino
    dominos.find { |d| chain_last == d.left || chain_last == d.rotate.left }
  end

  def chain_last
    circles.last.last.right
  end

  def prepare(domino_arrs)
    domino_arrs.map { |arr| Domino.new(*arr) }
  end
end
