# frozen_string_literal: true

# Class for finding count of people in group
class Second
  def self.find_in_group(str)
    str.split(/[,.|]+ +/).sort.group_by { |group| group[0..6] }.transform_values(&:count)
  end
end
