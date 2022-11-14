# frozen_string_literal: true

require_relative 'lab6_part2.rb'

RSpec.describe Second do
  it 'should calculate correctly' do
    result = Second.calculate(0.0001)
    expect(result.last).to be_within(1e-3).of(0.9899999999)
  end

  it 'should has correct number of iterations' do
    result = Second.calculate(0.0001)
    expect(result.first).to eq(100)
  end
end
