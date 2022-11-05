# frozen_string_literal: true

# Class to calculate rows
class First
  attr_reader :iter_count

  def initialize
    @iter_count = 0
  end

  def calculate(inp)
    p summ = next_elem(1)
    count = 2
    while next_elem(count).abs >= inp
      p summ += next_elem(count)
      count += 1
    end
    @iter_count = count
    summ
  end

  private

  def next_elem(count)
    1.0 / (count * (count + 1))
  end
end
