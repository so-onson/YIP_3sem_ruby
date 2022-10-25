# frozen_string_literal: true

# Class to calculate rows
class Second
    attr_reader :iter_count
  
    def initialize
      @iter_count = 0
    end
  
    def calculate(inp)
        list = Enumerator.new do |yielder|
            summ = 0
            count = 1
            loop do
              yielder.yield summ, count
      
              summ += 1.0 / (count * (count + 1))
              count += 1
              @iter_count = count
            end
        end
      
          arr = list.take_while { |sum, real| elem(count).abs >= inp }
          @iter_count = arr.last[2] - 1
          arr.last[0]
    end
end
  