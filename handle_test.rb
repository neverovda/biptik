require_relative './1/sequence.rb'
require_relative './2/pascals_triangle.rb'
require_relative './3/code.rb'
require_relative './4/coin_change.rb'
require_relative './5/chess.rb'
require_relative './6/domino_box.rb'

puts '---< 1 >---'
SequenceGenerator.get(7).each { |s| puts s }

puts '---< 2 >---'
TriangleGenerator.get(7).each { |s| puts s }

puts '---< 3 >---'
codes = ['512 25 407', '4561 2612 1234 5467', ' 9 ', 'sdsdasd1111$$$']
codes.each do |code|
  begin
    puts code.ljust(20) + " --- #{Code.new(code).correct?}"
  rescue Code::InappropriateCharactersError, Code::ShortCodeError => e
    puts code.ljust(20) + " --- #{e.message}"
  end
end

puts '---< 4 >---'
[13, 44, 88, 201, 389].each do |money|
  print money.to_s.ljust(20) + ' --- '
  p Cashier.change(money)
end

puts '---< 5 >---'
[['b2', 'h2'], ['c7', 'e8'], ['b6', 'f2']].each do |comb|
  puts "Combination #{comb}. Strike: #{Chess.new(comb[0],comb[1]).strike?}"
end

puts '---< 6 >---'

classical_dominos = []
(0..6).each do |left|
  (0..6).each { |right| classical_dominos << [left, right] }
end
classical_dominos.map! {|e| e.sort }.uniq!.shuffle!

puts 'classic domino:'
p classical_dominos
puts 'after ordering:'
p DominoBox.new(*classical_dominos).chain

puts "\n-----------\n"

puts '2 classic domino:'
dominos2x = classical_dominos + classical_dominos
p dominos2x
puts 'after ordering:'
p DominoBox.new(*dominos2x).chain

puts "\n-----------\n"

puts 'classic domino withoun one member [3, 5]:'
classical_dominos.delete [3, 5]

p dominos2x
puts 'after ordering:'
p DominoBox.new(*classical_dominos).chain
