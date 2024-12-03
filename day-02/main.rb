# frozen_string_literal: true

input = ARGF.readlines(chomp: true)
reports = input.map { |line| line.split.map(&:to_i) }

def safe?(levels)
  diffs = levels.each_cons(2).map { _2 - _1 }
  dirs = levels.each_cons(2).map { _2 <=> _1 }.tally
  return false if dirs.key?(1) && dirs.key?(-1)
  return false if diffs.any? { |n| n.abs > 3 || n.zero? }

  true
end

part_1 = reports.count do |levels|
  safe?(levels)
end

part_2 = reports.count do |levels|
  permutations = [levels]
  levels.each_index do |i|
    new_levels = levels.dup
    new_levels.delete_at(i)
    permutations << new_levels
  end

  permutations.any? { |levels| safe?(levels) }
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"
