# require 'rails_helper'

# RSpec.describe EvqlidResult, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end



require 'rails_helper'

RSpec.describe EvqlidResult, type: :model do
  it "adds records to db" do
    EvqlidResult.create(num1: 3, num2: 2, nod: 1, nok: 6)
    found = EvqlidResult.find_by(num1: 3, num2: 2)
    expect(found).not_to be_nil

    expect(found.num1).to eq 3
    expect(found.num2).to eq 2

    expect(found.nod).to eq 1
    expect(found.nok).to eq 6
  end

  it "validates uniqueness" do
    EvqlidResult.create(num1: 3, num2: 2, nod: 1, nok: 6)

    record = EvqlidResult.create(num1: 3, num2: 2, nod: 1, nok: 6)
    expect(record.valid?).to eq false

    record = EvqlidResult.create(num1: 3, num2: 2, nod: 1, nok: 6)
    expect(record.valid?).to eq false
  end

  it "validates presence" do
    record = EvqlidResult.create(num1: 3, num2: 2)
    expect(record.valid?).to eq false
  end

  it 'creates corresponding steps' do
    EvqlidResult.get(1, 2)
    res = EvqlidResult.find_by(num1: 1, num2: 2)
    expect(res.evqlid_iteration.many?).to eq true
  end
end