# frozen_string_literal: true

MUL = /mul\((\d+),(\d+)\)/
DO = "do()"
DONT = "don't()"

def mul(x, y)
  x.to_i * y.to_i
end

input = ARGF.read.chomp

part_1 = input.scan(MUL).sum { |x, y| mul(x, y) }

pattern = Regexp.union(DO, DONT, MUL)
tokens = input.prepend(DO).scan(/(#{pattern})/)
part_2 = tokens.sum do |instruction, x, y|
  instruction==DO..instruction==DONT ? mul(x, y) : 0
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"
