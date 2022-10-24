# frozen_string_literal: true

# Class for calculating
class First
  def self.calc(str)
    # unless str.match?(/^-?\d+[ ,]+-?\d+$/) {return 'Bad input, exit...'}
    numa, numb = str.split.map(&:to_f)
    (Math.sin(numa) - numb) / (numb.abs + Math.cos(numb**2))
  end
end
