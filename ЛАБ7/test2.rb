require_relative 'lab7_part2.rb'

RSpec.describe Troika do
    let(:troika) { Troika.new('60 * 10.5') }

    it 'should has child TroikaSkobka' do
      child_classes = ObjectSpace.each_object(Class).select { |klass| klass < Troika }
      expect(child_classes.include?(TroikaSkobka)).to eq(true)
    end
  
    it 'should calculate correctly' do
      expect(troika.calc).to eq(630.0)
    end
  end
  
  RSpec.describe TroikaSkobka do
    let(:troikask) { TroikaSkobka.new('(60 * 10.5)') }
  
    it 'should be child of Troika' do
      expect(TroikaSkobka.superclass).to eq(Troika)
    end
  
    it 'should calculate correctly' do
      expect(troikask.calc).to eq(630.0)
    end

  end