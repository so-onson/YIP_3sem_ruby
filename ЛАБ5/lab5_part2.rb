# frozen_string_literal: true

# Class for finding count of people in group
class Second
  def self.find_in_group(str)
    new_str_arr = str.split(/[,.|]+ +/).sort

    new_str1 = new_str_arr.group_by { |group| group[0..6] }.transform_values(&:count)
  end
end
