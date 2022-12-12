require 'rails_helper'

RSpec.describe 'Examples', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/example/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/example/show', params: {num1:6, num2:24}
      expect(response).to have_http_status(:success)
    end

    context 'shouldn`t redirect and return http Error if' do
      it 'redirecting was without params' do
        get '/example/show'
        expect(response).to have_http_status(302)
      end

      it 'redirecting was with empty params' do
        get '/example/show', params: {}
        expect(response).to have_http_status(302)
      end

      it 'input \'67ff\'' do
        get '/example/show', params: { n: '67ff' }
        expect(response).to have_http_status(302)
      end

      it 'input \'d5\'' do
        get '/example/show', params: { n: 'd5' }
        expect(response).to have_http_status(302)
      end

      it 'input words' do
        get '/example/show', params: { n: 'help' }
        expect(response).to have_http_status(302)
      end
    end


    context 'should return body contains' do
      it 'input 17, 68' do
        get '/example/show', params: {num1:17, num2:68}
        html = Nokogiri::HTML(response.body)
        expects = [1,	51, 17,	2, 34, 17, 3,	17, 17, 4, 0, 17] 
        expects.each_with_index do |el, idx|
          p div = html.search('td')[idx.to_i].text.to_i
          expect(div).to eq(el)
        end
      end
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
end
