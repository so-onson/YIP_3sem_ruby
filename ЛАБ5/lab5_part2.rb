# frozen_string_literal: true

# class Second
# (“ИУ6-31Б Иванов Иван”, “ИУ6-32Б Петрова Ка
def find_in_group(str)
    new_str_arr = str.split(/[,.|]+ +/).sort
    # p new_str_arr
    new_str = new_str_arr.group_by { |group| group[0..6].to_sym }.transform_values(&:count)
    # p new_str
  end
  # end
p  find_in_group('ИУ6-32Б иванов,,, ИУ6-32Б петров.,  ИУ6-31Б калакин, ИУ6-33Б романов')
  