require 'nokogiri'
doc = Nokogiri::XML(File.read('/home/Documenrs/BMSTU/ЛАБ_10/xslt-api/response.xml'))
xslt = Nokogiri::XSLT(File.read('/home/kiryu/VUZ/WPL/laboratories/10/lab10/transform.xslt'))
puts xslt.transform(doc)