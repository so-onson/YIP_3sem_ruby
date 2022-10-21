# frozen_string_literal: true

def calc(str)
  # unless str.match?(/^-?\d+[ ,]+-?\d+$/) {return 'Bad input, exit...'}
  num1, num2 = str.split.map(&:to_f)
  p (Math.sin(num1) - num2) / (num2.abs + Math.cos(num2**2))
end
