class EvqlidResult < ApplicationRecord
    validates :num1, uniqueness: { scope: :num2 }
    validates :num1, :num2, presence: true
    before_save :encode_res
  
    def decoded_res
      ActiveSupport::JSON.decode(result1)
    end
  
    private
  
    def encode_res
      self.result1 = ActiveSupport::JSON.encode(calculating)
    end
  
    def calculating
      arr = []
      n1 = num1.to_i
      n2 = num2.to_i
      while [n1, n2].min != 0
        if n1 < n2
          n2 -= n1
        else
          n1 -= n2
        end
        arr.push([n1, n2])
      end
      return arr unless arr.length.zero?
    end
end
