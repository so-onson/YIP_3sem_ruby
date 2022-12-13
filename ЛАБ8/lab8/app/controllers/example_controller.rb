# frozen_string_literal: true

# class main
class ExampleController < ApplicationController
  before_action :check, only: [:show]

  def input; end

  def show
    @i = 0
    @summ = calc_sum
    if (result = (EvqlidResult.find_by(num1: @input1 = params[:num1], num2: @input2 = params[:num2]) || EvqlidResult.find_by(num1: @input1 = params[:num2], num2: @input2 = params[:num1])))
      @result_fin = result.decoded_res
    else
      result = EvqlidResult.new(num1: @input1, num2: @input2)
      if result.save
        @result_fin = result.decoded_res
      else
        redirect_to root_path, notice: result.errors.messages[:input][0]
      end
    end
  end

  def show_db
    # Задание с сериализацией
    # Для отрисовки в views/layouts/application.html.erb добавили <html data-turbo='false'>
    render xml: EvqlidResult.all
  end

  private

  def calc_sum
    params[:num1].to_i * params[:num2].to_i
  end

  def check
    return redirect_to root_path unless check_nil(params[:num1]).nil?

    return redirect_to root_path unless check_nil(params[:num2]).nil?

    return redirect_to root_path unless check_word.nil?
  end

  def check_nil(num)
    flash[:error] = 'Incorrect input: empty params' if num.nil? || num.empty?
  end

  def check_word
    flash[:error] = 'Error: Input negative' if params[:num1].match(/^-\d+$/) || params[:num2].match(/^-\d+$/)

    flash[:error] = 'Error: Input words' if params[:num1].match(/\D+/) || params[:num2].match(/\D+/)
  end
end
