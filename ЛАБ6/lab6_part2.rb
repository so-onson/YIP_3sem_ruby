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
              @iter_count = k
            end
          end
      
          arr = list.take_while { |sum, real| (sum - real).abs >= inp }
          @iter_count = arr.last[2] - 1
          arr.last[0]


      count = 1
      summ = next_elem(count)
      while next_elem(count).abs >= inp
        summ += next_elem(count)
        count += 1
      end
      @iter_count = count
      summ
    end
  
    private
  
    def next_elem(count)
      p 1.0 / (count * (count + 1))
    end
  end
  