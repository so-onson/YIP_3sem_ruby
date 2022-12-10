class EvqlidResult < ApplicationRecord
    validates :num1, uniqueness: { scope: :num2 }
    validates :num1, :num2, presence: true
    # validates :input, format: { with: /\A\d+\z/, message: 'Должно быть введено положительное число' }
    # before_safe set_result1()

    def decoded_result1
        # ActiveSupport::JSON.decode(result1)
    end

    # def decoded_result2
    #     ActiveSupport::JSON.decode(result2)
    # end


    def set_result1
        # self.result1 = ActiveSupport::JSON.encode(calc_nod)
    end
    private



    # def set_result2
    #     self.result2 = ActiveSupport::JSON.encode(                        )
    # end

    def calc_nod
        mres = num1
        nres = num2
        iter = 0
        @result = Enumerator.new do |yielder|
          loop do
            yielder << if mres < nres
                         [iter += 1, mres, nres -= mres]
                       else
                         [iter += 1, mres -= nres, nres]
                       end
          end
        end.take_while { |_, first, second| [first, second].min != 0 }
        @nod = [mres, nres].max
        
        @nok = calc_sum

        return @result unless @result.length.zero?
    end
    
      def calc_sum
        num1 * num2 / nod
      end


end
