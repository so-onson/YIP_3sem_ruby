# frozen_string_literal: true

# Class to calculate rows
class First
  attr_reader :iter_count

  def initialize
    @iter_count = 0
  end

  def calculate(inp)
    count = 1
    summ = next_elem(count)
    while next_elem(count).abs >= inpl
      summ += next_elem(count)
      count += 1
    end
    @iter_count = count
    summ
  end

  private

  def next_elem(count)
    p 1.0 / (count * (count + 1))
  end
end
