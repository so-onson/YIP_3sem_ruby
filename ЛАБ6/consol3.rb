# frozen_string_literal: true

require_relative 'lab6_part3.rb'

lambda_function1 = ->(x) { x * (x - 1) }
# lambda_function2 = ->(x) { Math.exp(x) / (x + 1) }

puts Third.intprg(0, 2, &lambda_function1)
# puts Third.intprg(0, 1, &lambda_function2)
puts 'Proc'
pr = proc { |x| (Math.exp(x) / (x + 1)) }
puts Third.intprg(0, 1, &pr)
puts 'Next integral'
puts Third.intprg(0, 1) { |x| (Math.exp(x) / (x + 1)) }
