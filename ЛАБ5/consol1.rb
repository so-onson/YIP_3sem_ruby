require_relative 'labb5'
require_relative 'lab5_part2'
require_relative 'lab5_part3'
# find_in_group('ИУ6-32Б иванов,,, ИУ6-32Б петров.,  ИУ6-31Б калакин, ИУ6-33Б романов')
# puts calc(gets)

printf 'Select part (1..3): '
part = gets
part = part.match?(/^\d$/) ? Integer(part) : 0
case part
when 1
    printf 'Input numbers: '
    puts calc(gets)
when 2
    printf 'Input group: '
    puts find_in_group(gets)
    # puts find_in_group('ИУ6-32Б иванов,,, ИУ6-32Б петров.,  ИУ6-31Б калакин, ИУ6-33Б романов')
when 3
    mixi = Integer(gets)
    p find_k_maxmin(gets, mixi)
else
  p 'Bad input, exit...'
end