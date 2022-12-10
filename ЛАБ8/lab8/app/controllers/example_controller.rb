# frozen_string_literal: true

# class main
class ExampleController < ApplicationController
  before_action :check, only: [:show]

  def input; end

  def show
    # @res = calc_nod(params[:num1].to_i, params[:num2].to_i)
    # @summ = calc_sum
    if (result = EvqlidResult.find_by(@num1 = params[:num1], @num2 = params[:num2]))
      @res = result.decoded_result1
    else
      result = EvqlidResult.new(num1: @num1, num2: @num2)
      if result.save
        @res = result.decoded_result1
      else
        redirect_to root_path, notice: result.errors.messages[:num1][0]
      end
    end
  end

  def show_db
    # Задание с сериализацией
    # Для отрисовки в views/layouts/application.html.erb добавили <html data-turbo='false'>
    render xml: EvqlidResult.all
  end

  private

  # def calc_nod(mres, nres)
  #   iter = 0
  #   @result = Enumerator.new do |yielder|
  #     loop do
  #       yielder << if mres < nres
  #                    [iter += 1, mres, nres -= mres]
  #                  else
  #                    [iter += 1, mres -= nres, nres]
  #                  end
  #     end
  #   end.take_while { |_, first, second| [first, second].min != 0 }
  #   @k_k = [mres, nres].max
  # end

  # def calc_sum
  #   params[:num1].to_i * params[:num2].to_i / @k_k
  # end

 

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
