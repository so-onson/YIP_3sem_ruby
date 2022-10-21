require_relative 'lab5_part2'

#   RSpec.describe find_in_group() do
  
    describe "find_in_group" do 
      context " when value is true" do
        
        it 'should return "ИУ6-31Б"=>1, "ИУ6-32Б"=>2, "ИУ6-33Б"=>1' do
            result = find_in_group('ИУ6-32Б иванов,,, ИУ6-32Б петров.,  ИУ6-31Б калакин, ИУ6-33Б романов')
            expect(result).to eq({:"ИУ6-31Б"=>1, :"ИУ6-32Б"=>2, :"ИУ6-33Б"=>1})
        end
      
      end

    end