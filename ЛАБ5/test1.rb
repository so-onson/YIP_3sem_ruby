require_relative 'lab5_part1.rb'
 RSpec.describe First do
  
    # describe "calc('5, 6')" do 
      context 'when value is true' do
        
        it 'should return -1.18509' do
            # result = calc('5, 6')
            expect(described_class.calc('5 6')).to be_within(1e-3).of(-1.18509)
        end

        it 'should return -1.02179' do
            expect(described_class.calc('0 6')).to be_within(1e-3).of(-1.02179)
        end

        it 'should return 1.02179' do
          expect(described_class.calc('0 -6')).to be_within(1e-3).of(1.02179)
        end
      
      end
    end

