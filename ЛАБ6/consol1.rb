# frozen_string_literal: true

require_relative 'lab6_part1.rb'

puts('Input the accuracy')
e = gets.chomp.to_f
part = First.new
puts "The result is: #{part.calculate(e)}"
puts "Number of iterations: #{part.iter_count}"
