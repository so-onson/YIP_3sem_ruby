# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Examples', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  # Проверка на успешное добавление и поиск элемента в БД
  describe 'Add and search db(check adding to db)' do
    num1 = 36
    num2 = 78
    it 'Adds correctly' do
      expect(EvqlidResult.create(num1: num1, num2: num2)).not_to be_nil
      expect(EvqlidResult.find_by(num1: num1, num2: num2)).not_to be_nil
    end
  end

    # Проверка на уникальность созданных полей
  # При добавлении через форму проверяет в контроллере, в других случаях смотрит на
  #  validates_uniqueness_of :input, :twins в models/twins.rb

  # Проверка на различный результат при различных входных данных
  describe 'WE have different results when enter different input values' do
    it '1==2' do
      num1 = 36
      num2 = 78
      EvqlidResult.create(num1: num1, num2: num2)
      EvqlidResult.create(num1: num2, num2: num1)
      t1 = EvqlidResult.find_by(num1: num1, num2: num2)
      t2 = EvqlidResult.find_by(num1: num2, num2: num1)
      expect(t1).not_to eq(t2)
    end
  end

  describe 'GET /show' do
    subject { post example_show_path, params: { num1: 2, num2: 3 }, xhr: true }
    it 'returns http success' do
      subject
      expect(response).to have_http_status(:success)
    end

    context 'shouldn`t redirect and return http Error if' do
      it 'redirecting was without params' do
        post '/example/show'
        expect(response).to have_http_status(:redirect)
      end

      it 'redirecting was with empty params' do
        post '/example/show', params: {}
        expect(response).to have_http_status(302)
      end

      it 'input \'67ff\'' do
        post '/example/show', params: { n: '67ff' }
        expect(response).to have_http_status(302)
      end

      it 'input \'d5\'' do
        post '/example/show', params: { n: 'd5' }
        expect(response).to have_http_status(302)
      end

      it 'input words' do
        post '/example/show', params: { n: 'help' }
        expect(response).to have_http_status(302)
      end
    end
  end
end

RSpec.describe 'Test model', type: :model do
  it 'another checks uniqueness_of field' do
    EvqlidResult.create!(num1: "5", num2: "15")
    expect { EvqlidResult.create!(num1: "5", num2: "15") }.to raise_error ActiveRecord::RecordInvalid
  end
end
