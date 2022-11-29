# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  # автоматически создаем значения x и y
  let(:num1_value) { Faker::Number.number(digits: 1) }
  let(:num2_value) { Faker::Number.number(digits: 1) }

  # сценарий успешного складывания x + y
  scenario 'calculte' do
    visit root_path # переходим на страницы ввода

    fill_in :num1, with: num1_value # заполняем поле с name="x"
    fill_in :num2, with: num2_value # заполняем поле с name="y"

    # choose('operation_+') # выбираем radio_button с id="operation_+"
    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"

    # ожидаем найти в контенере вывода правильное содержимое
    expect(find('#NOD')).to have_text("Наибольший общий делитель: #{@k_k}")
    expect(find('#NOK')).to have_text("Наименьшее общее кратное: #{@summ}")
  end


  # сценарий неправильного ввода формы
  scenario 'do not fill any values in form and click submit' do
    visit root_path # переходим на страницу ввода
    fill_in :num1, with: '' # заполняем поле с name="x"
    fill_in :num2, with: '' # заполняем поле с name="y"



    find('#calculate-btn').click # нажимаем на кнопку с id="calculate_btn"

    # ожидаем найти в контенере вывода содержимое с выводом всех ошибок модели
      expect(find('.error')).to have_text('Incorrect input: empty params')
  end
end