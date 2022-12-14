# frozen_string_literal: true

# class main
class XmlController < ApplicationController
  before_action :check, only: :index
  before_action :parse_params, only: :index

  def index
    # @res, @nod, @nok = calc_nod(@input1, @input2)
    # @summ = calc_sum
    @res, @nod, @nok = euclid_algorithm
    data = generate_xml_res
    respond_to do |format|
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end

  private

  def parse_params
    @input1 = params[:num1].to_i
    @input2 = params[:num2].to_i
  end

  def generate_xml_res
    {
      result: {
        num1: @input1, num2: @input2,
        iterations: @res.map do |res, index|
                      { index: index+1, num1: res[0], num2: res[1] }
                    end,
        nod: @nod, nok: @nok
      }
    }
  end

  # def calc_nod(m, n)
  #   arr = []
  #   n1 = m
  #   n2 = n
  #   while [n1, n2].min != 0
  #     if n1 < n2
  #       n2 -= n1
  #     else
  #       n1 -= n2
  #     end
  #     arr.push([n1, n2])
  #   end
  #   unless arr.length.zero?
  #   nod = arr.blank? ? m : arr.last.max
  #   nok = m * n / nod

  #   [arr, nod, nok]
  #   end
  # end


  def euclid_algorithm
    results = euclid_enumerator(@input1, @input2)
              .each_with_index
              .take_while { |res, _| [res[0], res[1]].min != 0 }

    nod = results.blank? ? @input1 : results[-1][0].max
    nok = @input1 * @input2 / nod

    [results, nod, nok]
  end

  def euclid_enumerator(first, second)
    Enumerator.new do |yielder|
      loop do
        yielder << if first < second
                     [first, second -= first]
                   else
                     [first -= second, second]
                   end
      end
    end
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
# http://localhost:3000/?num1=2&num2=3&format=xml
