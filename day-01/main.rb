# frozen_string_literal: true

input = ARGF.readlines(chomp: true).map { |line| line.split.map(&:to_i) }

left_list, right_list = input.transpose.map(&:sort)
right_tally = right_list.tally

part_1 = left_list.zip(right_list).sum do |left, right|
  distance = (left - right).abs
end

part_2 = left_list.sum do |number|
  number * right_tally.fetch(number, 0)
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"
