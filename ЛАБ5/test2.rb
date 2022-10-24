require_relative 'lab5_part2'

  RSpec.describe Second do
      context " when value is true" do
        # let(:temps) {rand(100)} {faker::internet}переменная во всем этом контексте let! 
        #() точно стопроцентно выполится {} надо выполнить обязательно или тест завален
        
        it 'should return "ИУ6-31Б"=>1, "ИУ6-32Б"=>2, "ИУ6-33Б"=>1' do
            expect(described_class.find_in_group('ИУ6-32Б иванов,,, ИУ6-32Б петров.,  ИУ6-31Б калакин, ИУ6-33Б романов')).to eq({"ИУ6-31Б"=>1, "ИУ6-32Б"=>2, "ИУ6-33Б"=>1}) #to be_instance_of(Hash)
        end
      end

      context " random test" do
        it 'random test' do
          
              arr_group = (1..5).map{Random.rand(1..4)}

              group = ['ИУ6-31Б', 'ИУ6-32Б', 'ИУ6-33Б', 'ИУ6-34Б', 'ИУ6-35Б']
              new_group = Hash[group.zip(arr_group)]
              names = ['Катя', 'Никитос', 'Рузальда', 'Максон', 'Романов']

          strings = new_group.map {|key, value| (1..value).map { key + ' ' + names[Random.rand(0..4)] + ', '}}.join

          expect(described_class.find_in_group(strings)).to eq(new_group)

        end
      
      end
end