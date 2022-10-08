require_relative 'labb5'
# RSpec.describe calc() do
  
    describe 'calc' do 
      context " when value is true" do
        
        it 'should return -1.18509' do
            result = calc(5,6)
          expect(result).to be_within(1e-3).of(-1.18509)
        end
      
      end
    end