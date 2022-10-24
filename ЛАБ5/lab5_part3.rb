# frozen_string_literal: true

# Class for finding k minimal and k maximal
class Third
  def self.find_k_maxmin(str, kkk)
    bord = kkk - 1
    arr = str.split.map(&:to_i).sort
    min_arr = arr[0..bord]
    max_arr = arr.reverse[0..bord]
    [max_arr, min_arr]
  end
end
