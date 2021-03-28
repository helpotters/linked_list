# lib/main.rb
require_relative './linked_list'

list = LinkedList.new
list.prepend('opponent')
list.append('spongebob')
list.prepend('knight')
list.prepend('pawn')
list.prepend('queen')
list.append('actual last value but itll be popped')
list.prepend('king')
list.prepend('bishop')
list.prepend('rook')
list.prepend('first')
list.to_s
puts list.size
puts list.at(8)
puts list.find('knight')
puts list.find('first')
list.pop
puts list.contains?('rook')
list.insert_at('player', 5)

list.to_s

list.remove_at(5)

list.to_s

puts list.size
