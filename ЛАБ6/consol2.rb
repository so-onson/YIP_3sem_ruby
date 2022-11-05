require_relative 'lab6_part2.rb'

ans = Second.calculate(0.001)

puts "Value with with an accuracy of 0.001: #{ans[0]}\n"
puts "Iterations count #{ans[1]}"

ans = Second.calculate(0.0001)

puts "Value with with an accuracy of 0.0001: #{ans[0]}\n"
puts "Iterations count #{ans[1]}"