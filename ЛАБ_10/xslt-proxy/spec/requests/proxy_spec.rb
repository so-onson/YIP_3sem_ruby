require 'rails_helper'
# require 'spec_helper'

RSpec.describe "Proxies", type: :request do
  describe "GET /input" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /' do
    it 'Check server response' do
      { 'server': 'html', 'client': 'xml' }.each do |side, type|
        get '/proxy/output/', params: { num1: rand(1..100), num2: rand(1..100), side: 'server', commit: 'Отправить' }
        expect(response).to have_http_status(:success)
        expect(response.headers['Content-Type']).to include(type)
      end
    end
  end

  describe "GET /output" do
    it 'returns html when "server" side is chosen' do
      get proxy_output_path, params: { num1: rand(1..100), num2: rand(1..100), side: 'server' }
      expect(response.content_type).to eq 'text/html; charset=utf-8'
      end

    it 'returns xml when "client" side is chosen' do
      get proxy_output_path, params: { num1: 36, num2: 48, side: 'client' }
      expect(response.content_type).to eq 'application/xml; charset=utf-8'
    end
  end
end
