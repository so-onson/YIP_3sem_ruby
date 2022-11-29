# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Examples', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/example/input'
      expect(response).to have_http_status(:success)
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

    context 'should return body contains' do
    subject { post example_show_path, params: { num1: 17, num2: 68 }, xhr: true }

      it 'input 17, 68' do
        subject
          expect(assigns(:result).flatten).to eq([1,	17, 51, 2, 17, 34, 3, 17, 17])

      end
    end
  end

  describe 'Capybara test case', type: :feature do
    context 'Capybara test case' do
  
        it 'header' do
          visit root_path
          expect(page). to have_content 'Example'
        end
      end
    end

  describe 'Selenium WebDriver open root_path and', type: :feature do
    before(:each) do
      @driver = Selenium::WebDriver.for :firefox
      @base_url = 'https://google.com'
      @accept_next_alert = true
      @driver.manage.timeouts.implicit_wait = 30
      @verification_errors = []
    end

    after(:each) do
      @driver.quit
      expect(@verification_errors.size).to be_zero
    end
  end
end
