class SessionController < ApplicationController
  def login;  end

  def authorize
    user = User.find_by(name: params[:name])
    return redirect_to_login if user.nil?
    return redirect_to_login unless user.authenticate(params[:password])

    session[:current_user_id] = user.id
    redirect_to example_input_path
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end

  private

  def redirect_to_login
    redirect_to root_path, flash: { alert: 'Неправильный пароль или логин'}
  end

end
