# frozen_string_literal: false

require 'nokogiri'
require 'open-uri'
# Docs
class ProxyController < ApplicationController
  before_action :check, only: :output
  before_action :parse_params, only: :output

  def input; end

  def output
    unless check.nil?
      return redirect_to '/proxy/input',
                         notice: check
    end
    api_response = URI.open(url)
    where(params[:side], api_response)
  end

  def where(side, api_response)
    case side
    when 'server'
      @result = xslt_transform(api_response).to_html
    when 'client-with-xslt'
      @result = insert_browser_xslt(api_response).to_xml
      # render xml: @result
      # render xml: insert_browser_xslt(api_response).to_xml
    when 'client'
      # render xml: api_response
      @result = api_response
      render xml: @result
    end
  end

  private

  def xslt_transform(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read("#{Rails.root}/public/server_transform.xslt"))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="/public/browser_transform.xslt"')
    doc.root.add_previous_sibling(xslt)
    # Возвращаем doc, так как предыдущая операция возвращает не XML-документ.
    doc
  end

  def url
    "http://localhost:3000/?num1=#{@num1}&num2=#{@num2}&form=xml"
  end

  def parse_params
    @num1 = params[:num1].to_i
    @num2 = params[:num2].to_i
    @side = params[:side]
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
