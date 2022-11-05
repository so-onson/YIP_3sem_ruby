# frozen_string_literal: true

# Class to calculate rows with enumerator
class Second
  def self.calculate(eps)
    sum = Enumerator::Lazy.new(1..Float::INFINITY) do |my_sum, val|
      my_sum << 1.0 / (val * (val + 1))
    end

    row_el_list = sum.take_while { |el| el >= eps }
    [row_el_list.to_a.size + 1, row_el_list.inject(:+)]
  end
end
