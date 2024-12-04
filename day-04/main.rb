# frozen_string_literal: true

require_relative "grid"

DELTAS = [
  [-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]
].freeze

X_DELTA_PAIRS = [
  [[-1, -1], [1, 1]],
  [[-1, 1], [1, -1]],
].freeze

input = ARGF.readlines(chomp: true)
grid = Grid.new(input.map(&:chars))

a_positions = []
x_positions = []

grid.each_cell do |cell, y, x|
  x_positions << [y, x] if cell == "X"
  a_positions << [y, x] if cell == "A"
end

part_1 = x_positions.sum do |y, x|
  DELTAS.count do |dy, dx|
    cy = y
    cx = x
    ["M", "A", "S"].all? do |char|
      cy += dy
      cx += dx
      grid[cy, cx] == char
    end
  end
end

part_2 = a_positions.count do |y, x|
  X_DELTA_PAIRS.all? do |pairs|
    pairs.filter_map { |dy, dx| grid[y + dy, x + dx] }.sort == ["M", "S"]
  end
end

puts "Part 1: #{part_1}"
puts "Part 2: #{part_2}"
