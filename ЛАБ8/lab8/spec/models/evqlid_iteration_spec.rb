require 'rails_helper'

RSpec.describe EvqlidIteration, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "validates uniqueness" do
    EvqlidIteration.create(evqlid_result_id: 1, iteration: 1)
    expect(EvqlidIteration.create(evqlid_result_id: 1, iteration: 1).valid?).to eq false
  end
end
