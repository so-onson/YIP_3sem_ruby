require 'rails_helper'

RSpec.describe EvqlidResult, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'another checks uniqueness_of field' do
    EvqlidResult.create!(num1: "5", num2: "15")
    expect { EvqlidResult.create!(num1: "5", num2: "15") }.to raise_error ActiveRecord::RecordInvalid
  end


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
    record = EvqlidResult.create(num1: 3)
    expect(record.valid?).to eq false
  end

  # Проверка на различный результат при различных входных данных
  describe 'WE have different results when enter different input values' do
    it "validates uniqueness" do
      num1 = 36
      num2 = 78
      EvqlidResult.create(num1: num1, num2: num2)
      expect(EvqlidResult.create(num1: num1, num2: num2).valid?).to eq false
    end
  end
end
