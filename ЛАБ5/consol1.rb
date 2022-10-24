require_relative 'lab5_part1'
require_relative 'lab5_part2'
require_relative 'lab5_part3'

printf 'Select part (1..3): '
part = gets
part = part.match?(/^\d$/) ? Integer(part) : 0
case part
when 1
    printf 'Input numbers: '
    puts First.calc(gets)
when 2
    printf 'Input groups: '
    puts Second.find_in_group(gets)
when 3
    printf 'Input number of elements in new array: '
    mixi = Integer(gets)
    printf 'Input your array: '
    p Third.find_k_maxmin(gets, mixi)
else
  p 'Bad input, exit...'
end