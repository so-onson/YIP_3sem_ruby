=begin
С клавиатуры вводится целочисленный массив и число K. Найти К
наибольших и К наименьших элементов в этом массиве и вывести их
=end

def find_k_maxmin(str, k)
    # return 'Bad input, exit...' unless str.match?(/^[-?\d+ ]$/)
    min_arr = str.split.map(&:to_i).sort[0..k-1]
    max_arr =  str.split.map(&:to_i).sort.reverse[0..k-1]
    return max_arr, min_arr
end

# p find_k_maxmin('5 87 9d -2 98',3)