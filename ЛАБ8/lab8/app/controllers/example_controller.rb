# frozen_string_literal: true

# class main
class ExampleController < ApplicationController
  before_action :check, only: [:show]

  def input; end

  def show
    @first_num = params[:num1].to_i
    @second_num = params[:num2].to_i

    @iterations, @nod, @nok = ActiveSupport::JSON.decode(EvqlidResult.get_json(@first_num, @second_num)).values
  end

  def show_db
    # respond_to do |form|
    #   form.xml { render xml: EvqlidResult.all.map(&:to_xml) }
    # end

    @ev_res = EvqlidResult.all.map(&:to_xml)

    respond_to do |format|
      format.html
      format.xml { render :xml => @ev_res }
    end
  end

  private

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
