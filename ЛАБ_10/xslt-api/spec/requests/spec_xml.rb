require 'rails_helper'

RSpec.describe 'Xml', type: :request do

  describe 'GET /' do
    it 'returns http success' do
      get '/', params: { num1: 10, num2: 5, format: :rss }

      expect(response).to have_http_status(:success)
      expect(response.headers['Content-Type']).to include('application/rss+xml')
    end

    it 'Compares two responses with different values' do
      get '/', params: { num1: rand(1..29), num2: rand(1..29), format: :xml }
      response1 = response
      get '/', params: { num1: rand(30..101), num2: rand(30..101), format: :xml }

      expect(response.body).not_to eq(response1.body)
    end
  end
end