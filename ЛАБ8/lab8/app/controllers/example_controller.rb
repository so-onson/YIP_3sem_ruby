# frozen_string_literal: true

# class main
class ExampleController < ApplicationController
  before_action :check, only: [:show]

  def input; end

  def show
    @res = calc_nod(params[:num1].to_i, params[:num2].to_i)
    @summ = calc_sum(@res)
  end

  private

  def calc_nod(m, n)
    @it_res = []
    until m.zero? || n.zero?
      if m >= n
        p m -= n
        @it_res << m
      else
        p n -= m
        @it_res << n
      end
    end
    m.zero? ? n : m
  end

  def calc_sum(k_k)
    params[:num1].to_i * params[:num2].to_i / k_k
  end

  def check
    if (params[:num1].empty?) && (params[:num2].empty? )
      flash[:error] = 'Error: Empty params'
      redirect_to root_path
    elsif params[:num1].match(/^-\d+$/) && !params[:num2].match(/^-\d+$/)
      flash[:error] = 'Error: Input negative'
      redirect_to root_path
    end
  end
end
