require_relative 'lab5_part3'

RSpec.describe Third do

  context 'manual test' do
    it 'should return [[98.0, 87.0, 9.0], [-2.0, 5.0, 9.0]]' do
      expect(described_class.find_k_maxmin('5 87 9d -2 98', 3)).to eq([[98.0, 87.0, 9.0], [-2.0, 5.0, 9.0]])
    end
  end

  context 'random test' do
    it 'tests with random string' do
      k = Random.rand(1..10)

      min_bound = Random.rand(1..100)
      max_bound_l = min_bound + Random.rand(1..100)
      max_bound_r = max_bound_l + Random.rand(1..100)

      min_arr = (1..k).map { Random.rand(1..min_bound) }.sort
      max_arr = (1..k).map { Random.rand(max_bound_l..max_bound_r) }.sort.reverse

      input_arr = min_arr + max_arr + (1..Random.rand(0..10)).map { Random.rand((min_bound + 1)..(max_bound_l - 1)) }

      expect(described_class.find_k_maxmin(input_arr.shuffle.join(' '), k)).to eq([max_arr, min_arr])
    end
  end
end
