# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  let(:num1_value) { Faker::Number.number(digits: 1) }
  let(:num2_value) { Faker::Number.number(digits: 1) }

  scenario 'calculte' do
    visit root_path # переходим на страницы ввода

    fill_in :num1, with: num1_value
    fill_in :num2, with: num2_value

    find('#calculate-btn').click

    expect(find('#NOD')).to have_text("Наибольший общий делитель: #{@k_k}")
    expect(find('#NOK')).to have_text("Наименьшее общее кратное: #{@summ}")
  end

  # сценарий неправильного ввода формы
  scenario 'do not fill any values in form and click button' do
    visit root_path # переходим на страницу ввода
    fill_in :num1, with: ''
    fill_in :num2, with: ''

    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"

    expect(find('.error')).to have_text('Incorrect input: empty params')
  end
end
