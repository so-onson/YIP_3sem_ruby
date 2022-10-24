# frozen_string_literal: true

# Class for calculating
class First
  def self.calc(str)
    # unless str.match?(/^-?\d+[ ,]+-?\d+$/) {return 'Bad input, exit...'}
    num1, num2 = str.split.map(&:to_f)
    (Math.sin(num1) - num2) / (num2.abs + Math.cos(num2**2))
  end
end
