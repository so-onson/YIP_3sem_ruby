require 'rails_helper'

RSpec.describe 'application', type: :system do

  it 'returns valid values after registration and login' do
    visit root_path
    click_button 'Регистрация'
    expect(page).to have_current_path new_user_path

    fill_in :user_name, with: 'Megachell'
    fill_in :user_password, with: 'qwerty12345'
    fill_in :user_password_confirmation, with: 'qwerty12345'
    click_button 'Create User'
    expect(page).to have_current_path root_path

    fill_in :name, with: 'Megachell'
    fill_in :password, with: 'qwerty12345'
    click_button 'Вход'
    expect(page).to have_current_path example_input_path

    fill_in :num1, with: 24
    fill_in :num2, with: 36
    click_button 'Посчитать'

    expect(find('#NOD')).to have_content '12'
    expect(find('#NOK')).to have_content '72'
  end

  it "doesn't allow non-logged in users to calculate values" do
    visit example_input_path
    expect(page).to have_current_path root_path
  end

  it "doesn't allow uncorecct password" do 
    visit root_path
    click_button 'Регистрация'
    expect(page).to have_current_path new_user_path

    fill_in :user_name, with: 'Megachell'
    fill_in :user_password, with: 'qwerty12345'
    fill_in :user_password_confirmation, with: 'qwerty12345'
    click_button 'Create User'
    expect(page).to have_current_path root_path

    fill_in :name, with: 'Megachell'
    fill_in :password, with: 'qwerty'
    click_button 'Вход'
    expect(page).to have_current_path root_path
    expect(find('#error')).to have_text('Неправильный пароль или логин')
  end
end