# frozen_string_literal: true

# class main
class ExampleController < ApplicationController
  before_action :check, only: [:show]

  def input; end

  def show
    @i = 0
    @summ = calc_sum
    if result1 = (EvqlidResult.find_by(num1: @input1 = params[:num1], num2: @input2 = params[:num2]) || EvqlidResult.find_by(num1: @input1 = params[:num2], num2: @input2 = params[:num1]))
      @result_fin = result1.decoded_res
    else
      result1 = EvqlidResult.new(num1: @input1, num2: @input2)
      if result1.save
        @result_fin = result1.decoded_res
      else
        redirect_to root_path, notice: result1.errors.messages[:input][0]
      end
    end
  end

  def show_db
    # Задание с сериализацией
    # Для отрисовки в views/layouts/application.html.erb добавили <html data-turbo='false'>
    # render xml: EvqlidResult.all
    respond_to do |form|
      form.xml { render xml: EvqlidResult.all.map(&:to_xml) }
    end
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


  def to_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.result1 do
        xml.id id
        xml.nod nod
        xml.nok nok
        xml.iterations do
          evqlid_iterations.all.each do |iter|
            xml.iter do
              xml.id iter.index
              xml.num1 iter.num1
              xml.num2 iter.num2
            end
          end
        end
      end
    end.doc.root.to_xml
  end
end
