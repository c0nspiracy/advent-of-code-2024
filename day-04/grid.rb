# frozen_string_literal: true

class Grid
  def initialize(cells)
    @cells = cells
  end

  def each_cell
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        yield [cell, y, x]
      end
    end
  end

  def [](y, x)
    return unless y.between?(0, max_y)
    return unless x.between?(0, max_x)

    cells[y][x]
  end

  private

  attr_reader :cells

  def max_y
    @max_y ||= cells.length - 1
  end

  def max_x
    @max_x ||= cells.first.length - 1
  end
end
