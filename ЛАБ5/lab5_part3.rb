# frozen_string_literal: true

# Class for finding k minimal and k maximal
class Third
  def self.find_k_maxmin(str, kkk)
    # return 'Bad input, exit...' unless str.match?(/^[-?\d+ ]$/)
    min_arr = str.split.map(&:to_i).sort[0..kkk - 1]
    max_arr = str.split.map(&:to_i).sort.reverse[0..kkk - 1]
    [max_arr, min_arr]
  end
end
