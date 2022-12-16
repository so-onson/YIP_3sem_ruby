require "test_helper"
  require 'nokogiri'
  doc = Nokogiri::XML(File.read('/home/bison/Documents/BMSTU/ЯИП/ЛАБ_10/xslt-api/test_xml-api.xml'))
  # xslt = Nokogiri::XSLT(File.read('/home/bison/Documents/BMSTU/ЯИП/ЛАБ10/xslt-api/transform.xslt'))
  # puts xslt.transform(doc)
class XmlControllerTest < ActionDispatch::IntegrationTest

  
  # Функциональный тест
  # class XmlControllerTest < ActionDispatch
    # Проверяем, какой формат получили от контроллера при запросе в RSS.
    test 'check rss format' do
      # Делаем запрос с параметрами - словарь превратится в lower=10&upper=100&format=rss
      get '/', params: { num1: 100, num2: 40, format: :rss }
      # Проверили, что получили статус ответа 200 OK
      assert_response :success
      # Тип ответа лежит в его заголовках, поэтому смотрим туда.
      assert_includes @response.headers['Content-Type'], 'application/rss'
    end

    # test "should get index" do
    #   get euclid_index_url
    #   assert_response :success
    # end
  
    # test "should get result" do
    #   get euclid_result_url
    #   assert_response :success
    # end
end
