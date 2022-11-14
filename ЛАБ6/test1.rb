# frozen_string_literal: true

require_relative 'lab6_part1'

RSpec.describe First do
  let(:part) { First.new }

  it 'should calculate correctly' do
    expect(part.calculate(0.0001)).to be_within(1e-3).of(0.98999999)
  end

  it 'should has correct number of iterations' do
    part.calculate(0.0001)
    expect(part.iter_count).to eq(100)
  end
end
