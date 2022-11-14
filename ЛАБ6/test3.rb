# frozen_string_literal: true

require_relative 'lab6_part3'

RSpec.describe Third do
  context 'function y=2x' do
    it 'should be 0' do
      result = Third.intprg(-1, 1) { |x| x * 2 }
      expect(result).to be_within(1e-3).of(0)
    end

    it 'should be 4' do
      result = Third.intprg(0, 2) { |x| x * 2 }
      expect(result).to be_within(1e-3).of(4)
    end
  end
end
