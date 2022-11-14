# frozen_string_literal: true

require_relative 'lab7_part1.rb'

RSpec.describe First do
  it 'should make the G.txt file correctly' do
    p rand_str = 10.times.map { rand(-20..100) }.join(' ')
    p res_str = rand_str.split(' ').map(&:to_i).reject { |num| (num % 3 != 0) || (num % 7).zero? }.join(' ') + ' '
    First.make_files(rand_str)
    test_file = File.open('G.txt', 'r')
    expect(p(test_file.readline)).to eq(res_str)
  end
end
